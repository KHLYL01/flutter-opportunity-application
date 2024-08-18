import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ReportData {
  Crud crud;
  ReportData(this.crud);

  getAllDate() async {
    var response = await crud.getAllData(AppLink.reports);
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByUserProfileId(int id) async {
    var response = await crud.getAllData("${AppLink.reports}/users/$id");
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByCompanyProfileId(int id) async {
    var response = await crud.getAllData("${AppLink.reports}/companies/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required int companyProfileId,
    required int userProfileId,
    required String cause,
    required String details,
    required String imagePath,
  }) async {
    Map<String, String> data = {
      "companyProfileId": companyProfileId.toString(),
      "userProfileId": userProfileId.toString(),
      "cause": cause,
      "details": details,
    };

    List<String> keys = [];
    List<String> values = [];

    if (imagePath != '') {
      keys.add('imageFile');
      values.add(imagePath);
    }

    var response =
        await crud.postDataWithFile(AppLink.reports, data, keys, values);
    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.reports}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
