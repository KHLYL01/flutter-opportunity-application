import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class CompanyProfileData {
  Crud crud;
  CompanyProfileData(this.crud);

  getAllData() async {
    var response = await crud.getAllData(AppLink.companyProfile);
    return response.fold((l) => l, (r) => r);
  }

  getDataById({required int id}) async {
    var response = await crud.getData("${AppLink.companyProfile}/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required int userId,
    required String scope,
    required String imagePath,
  }) async {
    Map<String, String> data = {
      'userId': userId.toString(),
      'scope': scope,
    };

    List<String> keys = [];
    List<String> values = [];
    // ['imageFile', 'pdfFile']

    if (imagePath != '') {
      keys.add('imageFile');
      values.add(imagePath);
    }

    var response = await crud.postDataWithFile(
      AppLink.companyProfile,
      data,
      keys,
      values,
    );

    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.companyProfile}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
