import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class FreeJobData {
  Crud crud;
  FreeJobData(this.crud);

  getAllDate() async {
    var response = await crud.getAllData(AppLink.freeJobs);
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByUserId(int id) async {
    var response =
        await crud.getAllData("${AppLink.freeJobs}/userProfiles/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required String title,
    required String description,
    required String url,
    required int userProfileId,
    required int freeCategoryId,
  }) async {
    Map<String, dynamic> data = {
      "title": title,
      "description": description,
      "url": url,
      "userProfileId": userProfileId,
      "freeCategoryId": freeCategoryId,
    };

    var response = await crud.postData(AppLink.freeJobs, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDate({
    required int id,
    required String title,
    required String description,
    required String url,
    required int userProfileId,
    required int freeCategoryId,
  }) async {
    Map<String, dynamic> data = {
      "title": title,
      "description": description,
      "url": url,
      "userProfileId": userProfileId,
      "freeCategoryId": freeCategoryId,
    };
    var response = await crud.updateData("${AppLink.freeJobs}/$id", data: data);
    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.freeJobs}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
