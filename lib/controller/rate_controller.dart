import 'package:get/get.dart';
import 'package:opportunity_app/core/enums/status_request.dart';
import 'package:opportunity_app/core/functions/handling_data.dart';
import 'package:opportunity_app/core/services/services.dart';
import 'package:opportunity_app/data/model/rate_model.dart';

import '../core/constants/app_keys.dart';
import '../core/enums/crud_status.dart';
import '../core/functions/custom_snack_bar.dart';
import '../data/data_sources/remote/rate_data.dart';

abstract class RateController extends GetxController {
  getAllData();
  getAllDataByCompanyProfileId();
  postDate(int companyProfileId);
  updateDate(int id, int companyProfileId);
}

class RateControllerImp extends RateController {
  List<RateModel> rates = [];

  int get length => rates.length;

  RateData rateData = RateData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  RxDouble rate = 0.0.obs;
  RxInt review = 0.obs;

  @override
  getAllData() async {
    _crudDate(await rateData.getAllDate(), CrudStatus.get);
  }

  @override
  getAllDataByCompanyProfileId({int? id}) async {
    await _crudDate(
      await rateData.getAllDateByCompanyProfileId(
        id ?? myServices.getInt(AppKeys.profileId),
      ),
      CrudStatus.get,
    );

    rate(
      getTotalRateByCompanyId(
        id ?? myServices.getInt(AppKeys.profileId),
      ),
    );
    review(getReviewByCompanyId(
      id ?? myServices.getInt(AppKeys.profileId),
    ));
  }

  @override
  postDate(int companyProfileId) async {
    await _crudDate(
      await rateData.postDate(
        userProfileId: myServices.getInt(AppKeys.profileId),
        companyProfileId: companyProfileId,
        rate: rate.value,
      ),
      CrudStatus.post,
      companyId: companyProfileId,
    );
  }

  @override
  updateDate(int id, int companyProfileId) async {
    _crudDate(
        await rateData.updateDate(id: id, rate: rate.value), CrudStatus.update,
        companyId: companyProfileId);
  }

  _crudDate(var response, CrudStatus status, {int? companyId}) async {
    statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      switch (status) {
        case CrudStatus.get:
          {
            rates = RateModel.map(response);
            // customSnackBar(title: 'Done', message: 'Fetch Data Successfully');
          }
        case CrudStatus.post || CrudStatus.update:
          {
            Get.back();
            await getAllDataByCompanyProfileId(id: companyId);
          }
        case CrudStatus.delete:
          {}
      }
    } else {
      customSnackBar(title: 'Error', message: 'Not Found 404', isDone: false);
    }
    update();
  }

  getReviewByCompanyId(int id) {
    int count = 0;

    for (RateModel model in rates) {
      if (model.companyProfileId == id) {
        count++;
      }
    }
    return count;
  }

  getTotalRateByCompanyId(int id) {
    int count = 0;
    double sum = 0;
    for (RateModel model in rates) {
      if (model.companyProfileId == id) {
        count++;
        sum += model.rate;
      }
    }

    if (count == 0) {
      return 0.0;
    }

    return sum / count;
  }

  checkRate(int companyProfileId) {
    for (RateModel model in rates) {
      if (model.companyProfileId == companyProfileId &&
          model.userProfileId == myServices.getInt(AppKeys.profileId)) {
        return model.id;
      }
    }
    return null;
  }
}
