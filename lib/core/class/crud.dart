import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../enums/status_request.dart';
import '../functions/check_internet.dart';
import '../services/services.dart';

class Crud {
  MyServices services = Get.find();

  Future<Either<StatusRequest, Map>> postDataWithoutToken(
      String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(link),
          body: jsonEncode(data),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );
        log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map body;
          if (response.body.isEmpty) {
            body = {};
          } else {
            body = jsonDecode(response.body);
          }
          return Right(body);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(link),
          body: jsonEncode(data),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            'Authorization': 'Bearer ${services.getToken()}'
          },
        );
        log(response.statusCode.toString());
        if (response.statusCode.toString() == '200' ||
            response.statusCode.toString() == '201') {
          if (response.body.isEmpty) {
            return const Right({});
          }
          Map<String, dynamic> body = jsonDecode(response.body);
          return Right(body);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      e.printInfo();
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, String>> postDataWithFile(
    String link,
    Map<String, String> data,
    List<String> keysPath,
    List<String> filesPath,
  ) async {
    if (await checkInternet()) {
      var headers = {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${services.getToken()}',
      };
      var request = http.MultipartRequest('POST', Uri.parse(link));

      if (keysPath.isNotEmpty) {
        for (int i = 0; i < filesPath.length; i++) {
          request.files.add(
              await http.MultipartFile.fromPath(keysPath[i], filesPath[i]));
        }
      }
      request.fields.addAll(data);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      log(response.statusCode.toString());
      if (response.statusCode.toString() == '200' ||
          response.statusCode.toString() == '201') {
        return const Right("success");
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String link) async {
    try {
      if (await checkInternet()) {
        var headers = {'Authorization': 'Bearer ${services.getToken()}'};
        var response = await http.get(Uri.parse(link), headers: headers);
        log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> body = jsonDecode(response.body);
          log(body.toString());
          return Right(body);
        } else {
          log(response.reasonPhrase.toString());
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      e.printInfo();
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, List>> getAllData(String link) async {
    try {
      if (await checkInternet()) {
        var headers = {
          'Authorization': 'Bearer ${services.getToken()}',
        };
        var response = await http.get(Uri.parse(link), headers: headers);
        log(response.statusCode.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          List<dynamic> body = jsonDecode(response.body);
          log(body.toString());
          return Right(body);
        } else {
          log(response.reasonPhrase.toString());
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      e.printInfo();
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, String>> deleteData(String link) async {
    try {
      if (await checkInternet()) {
        var headers = {'Authorization': 'Bearer ${services.getToken()}'};
        var response = await http.delete(Uri.parse(link), headers: headers);
        log(response.statusCode.toString());

        if (response.statusCode == 204 || response.statusCode == 200) {
          return const Right("delete successfully");
        } else {
          log(response.reasonPhrase.toString());
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      e.printInfo();
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, String>> updateData(String link,
      {Map? data}) async {
    try {
      if (await checkInternet()) {
        var headers = {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer ${services.getToken()}'
        };

        var response = await http.put(Uri.parse(link),
            body: data != null ? jsonEncode(data) : null, headers: headers);
        log(response.statusCode.toString());

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 204) {
          return const Right("update successfully");
        } else {
          log(response.reasonPhrase.toString());
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      e.printInfo();
      return const Left(StatusRequest.serverException);
    }
  }
}
