import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ApplyData {
  Crud crud;
  ApplyData(this.crud);

  getAllDate() async {
    var response = await crud.getAllData(AppLink.applies);
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByStatus(String status) async {
    var response = await crud.getAllData("${AppLink.applies}/$status");
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByUserProfileId(int id) async {
    var response = await crud.getAllData("${AppLink.applies}/users/$id");
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByCompanyProfileId(int id) async {
    var response = await crud.getAllData("${AppLink.applies}/companies/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required int userProfileId,
    required int jobId,
  }) async {
    Map<String, dynamic> data = {
      'userProfileId': userProfileId,
      'jobId': jobId,
    };

    var response = await crud.postData(AppLink.applies, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDate({required int id, required String status}) async {
    Map<String, dynamic> data = {
      'status': status,
    };
    var response = await crud.updateData("${AppLink.applies}/$id", data: data);
    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.applies}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
