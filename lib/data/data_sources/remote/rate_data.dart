import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class RateData {
  Crud crud;
  RateData(this.crud);

  getAllDate() async {
    var response = await crud.getAllData(AppLink.rates);
    return response.fold((l) => l, (r) => r);
  }

  getAllDateByCompanyProfileId(int id) async {
    var response = await crud.getAllData("${AppLink.rates}/companyProfile/$id");
    return response.fold((l) => l, (r) => r);
  }

  postDate({
    required int userProfileId,
    required int companyProfileId,
    required double rate,
  }) async {
    Map<String, dynamic> data = {
      'userProfileId': userProfileId,
      'companyProfileId': companyProfileId,
      'rate': rate,
    };

    var response = await crud.postData(AppLink.rates, data);
    return response.fold((l) => l, (r) => r);
  }

  updateDate({
    required int id,
    required double rate,
  }) async {
    Map<String, dynamic> data = {
      'rate': rate,
    };
    var response = await crud.updateData("${AppLink.rates}/$id", data: data);
    return response.fold((l) => l, (r) => r);
  }
}
