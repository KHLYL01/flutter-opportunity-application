import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class SubCategoryData {
  Crud crud;
  SubCategoryData(this.crud);

  getAllDate() async {
    var response = await crud.getAllData(AppLink.jobSubCategories);
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByCategoryId({required int id}) async {
    var response =
        await crud.getAllData("${AppLink.jobSubCategories}/job_categories/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required String name,
    required int jobCategoryId,
  }) async {
    Map<String, dynamic> data = {
      'name': name,
      'jobCategoryId': jobCategoryId,
    };

    var response = await crud.postData(AppLink.jobSubCategories, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDate({
    required int id,
    required String name,
    required int jobCategoryId,
  }) async {
    Map<String, dynamic> data = {
      'name': name,
      'jobCategoryId': jobCategoryId,
    };
    var response =
        await crud.updateData("${AppLink.jobSubCategories}/$id", data: data);
    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.jobSubCategories}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
