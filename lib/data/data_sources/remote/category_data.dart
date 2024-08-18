import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);

  getAllDate() async {
    var response = await crud.getAllData(AppLink.jobCategories);
    return response.fold((l) => l, (r) => r);
  }

  postDate({required String name}) async {
    Map<String, dynamic> data = {
      'name': name,
    };

    var response = await crud.postData(AppLink.jobCategories, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDate({required int id, required String name}) async {
    Map<String, dynamic> data = {
      'name': name,
    };
    var response =
        await crud.updateData("${AppLink.jobCategories}/$id", data: data);
    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.jobCategories}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
