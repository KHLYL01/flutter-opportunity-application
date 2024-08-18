import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class UserProfileData {
  Crud crud;
  UserProfileData(this.crud);

  getAllData() async {
    var response = await crud.getAllData(AppLink.userProfile);
    return response.fold((l) => l, (r) => r);
  }

  getDataById({required int id}) async {
    var response = await crud.getData("${AppLink.userProfile}/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required int userId,
    required String age,
    required String gender,
    required String educationalLevel,
    required String specialty,
    required String location,
    required String nationality,
    required String imagePath,
    required String pdfPath,
  }) async {
    Map<String, String> data = {
      'userId': userId.toString(),
      'age': age,
      'gender': gender,
      'educationalLevel': educationalLevel,
      'nationality': nationality,
      'specialty': specialty,
      'location': location,
    };

    List<String> keys = [];
    List<String> values = [];
    // ['imageFile', 'pdfFile']

    if (imagePath != '') {
      keys.add('imageFile');
      values.add(imagePath);
    }

    if (pdfPath != '') {
      keys.add('pdfFile');
      values.add(pdfPath);
    }

    var response = await crud.postDataWithFile(
      AppLink.userProfile,
      data,
      keys,
      values,
    );

    return response.fold((l) => l, (r) => r);
  }

  updateRating({
    required int profileId,
    required int companyProfileId,
    required String ratingCompanyIds,
    required double totalRating,
    required int review,
  }) async {
    Map<String, dynamic> data = {
      'id': profileId,
      'companyProfileId': companyProfileId,
      'ratingCompanyIds': ratingCompanyIds,
      'totalRating': totalRating,
      'review': review,
    };

    var response = await crud.postData('${AppLink.userProfile}/rating', data);

    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.userProfile}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
