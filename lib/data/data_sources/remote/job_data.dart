import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class JobData {
  Crud crud;
  JobData(this.crud);

  getAllData() async {
    var response = await crud.getAllData(AppLink.jobs);
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByCompanyProfileId(int id) async {
    var response = await crud.getAllData("${AppLink.jobs}/companyProfile/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required String title,
    required String description,
    required int age,
    required String nationality,
    required String gender,
    required String jopType,
    required String experience,
    required String location,
    required String online,
    required String expiryDate,
    required int companyProfileId,
    required int jobSubCategoryId,
  }) async {
    Map<String, dynamic> data = {
      "title": title,
      "description": description,
      "age": 0,
      "nationality": nationality,
      "gender": gender,
      "jopType": jopType,
      "experience": experience,
      "location": location,
      "online": online,
      "expiryDate": expiryDate,
      "companyProfileId": companyProfileId,
      "jobSubCategoryId": jobSubCategoryId,
    };

    var response = await crud.postData(AppLink.jobs, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDate({
    required int id,
    required String title,
    required String description,
    required int age,
    required String nationality,
    required String gender,
    required String jopType,
    required String experience,
    required String location,
    required String online,
    required String expiryDate,
    required int companyProfileId,
    required int jobSubCategoryId,
  }) async {
    Map<String, dynamic> data = {
      "title": title,
      "description": description,
      "age": 0,
      "nationality": nationality,
      "gender": gender,
      "jopType": jopType,
      "experience": experience,
      "location": location,
      "online": online,
      "expiryDate": expiryDate,
      "companyProfileId": companyProfileId,
      "jobSubCategoryId": jobSubCategoryId,
    };
    var response = await crud.updateData("${AppLink.jobs}/$id", data: data);
    return response.fold((l) => l, (r) => r);
  }

  deleteDate({required int id}) async {
    var response = await crud.deleteData("${AppLink.jobs}/$id");
    return response.fold((l) => l, (r) => r);
  }
}
