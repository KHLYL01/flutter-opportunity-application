import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class FreeCategoryData {
  Crud crud;
  FreeCategoryData(this.crud);

  getAllDate() async {
    var response = await crud.getAllData(AppLink.freeCategories);
    return response.fold((l) => l, (r) => r);
  }

  postDate({required String name}) async {
    Map<String, dynamic> data = {
      'name': name,
    };

    var response = await crud.postData(AppLink.freeCategories, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDate({required int id, required String name}) async {
    Map<String, dynamic> data = {
      'name': name,
    };
    var response =
        await crud.updateData("${AppLink.freeCategories}/$id", data: data);
    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.freeCategories}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
