import 'dart:io';

import 'package:dio/dio.dart';
import 'model/api_response.dart';
import '/data/models/base.dart';
import 'constants/api_constants.dart';

class APIProvider {
  final baseOptions = BaseOptions(
    baseUrl: APIConstants.baseUrl,
  );
  late Dio _dio;
  static APIProvider? _instance;
  static APIProvider get instance {
    _instance ??= APIProvider._init();
    return _instance!;
  }

  APIProvider._init() {
    _dio = Dio(baseOptions);
  }

  APIResponse handleJson<T extends BaseModel>(response, T model) {
    switch (response.statusCode) {
      case HttpStatus.accepted:
      case HttpStatus.ok:
        final data = response.data;
        if (data is List) {
          return APIResponse(
            data: List<T>.from(data.map((e) => model.fromJson(e))),
            isSuccess: true,
          );
        } else if (data is Map) {
          return APIResponse(
            data: model.fromJson(data),
            isSuccess: true,
          );
        }
        break;
      default:
        break;
    }
    return APIResponse();
  }

  Future<APIResponse> get<T extends BaseModel>(String path, T model) async {
    try {
      final response = await _dio.get(path);
      return handleJson(response, model);
    } on DioError catch (exception) {
      if (exception.type == DioErrorType.response) {
        return APIResponse();
      }
      rethrow;
    }
  }

  Future<APIResponse> post<T extends BaseModel, R extends BaseModel>(
      String path, T requestModel, R responseModel) async {
    try {
      final response = await _dio.post(path, data: requestModel.toJson());
      return handleJson(response, responseModel);
    } on DioError catch (exception) {
      if (exception.type == DioErrorType.response) {
        return APIResponse();
      }
      rethrow;
    }
  }
}
