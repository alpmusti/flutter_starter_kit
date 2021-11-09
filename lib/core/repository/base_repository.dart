import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/core/networking/api_provider.dart';
import 'package:get/get.dart';
import '../networking/model/api_response.dart';
import '/core/utils/dialog/dialogs.dart';
import '/data/models/base.dart';

abstract class BaseRepository {
  final APIProvider _networkManager = APIProvider.instance;

  Future showLoading({
    String? labelKey,
    bool dissmissOnTap = false,
  }) async {
    if (labelKey != null) {
      await EasyLoading.show(status: labelKey, dismissOnTap: dissmissOnTap);
    } else {
      await EasyLoading.show(dismissOnTap: dissmissOnTap);
    }
  }

  Future<void> hideLoading() async {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
  }

  Future<APIResponse?> postRequest<T extends BaseModel, U extends BaseModel>(
      String path, T requestModel, U responseModel,
      {bool withLoading = true}) async {
    try {
      if (withLoading) {
        await showLoading();
      }
      final response =
          await _networkManager.post<T, U>(path, requestModel, responseModel);
      await hideLoading();
      return response;
    } catch (exception) {
      hideLoading();
      await Dialogs.showErrorDialog(
        content: Text('generic_error'.tr),
      );
    }
    return null;
  }

  Future<APIResponse?> getRequest<T extends BaseModel>(
      String path, T responseModel,
      {bool withLoading = true}) async {
    try {
      if (withLoading) {
        await showLoading();
      }
      final response = await _networkManager.get(path, responseModel);
      hideLoading();
      return response;
    } catch (exception) {
      await hideLoading();
      await Dialogs.showErrorDialog(
        content: Text('generic_error'.tr),
      );
    }
  }
}
