import 'package:dio/dio.dart';
import 'dart:io';
import '../../../../extension/network_extension.dart';
import '../../../../base/model/abstract/ife_base_model.dart';
import '../../../../base/model/abstract/ife_base_response_model.dart';
import '../../../../base/model/concrete/error_model.dart';
import '../../../../base/model/concrete/response_model.dart';
import '../../../../constants/enum/http_request_types_enum.dart';
import '../../abstract/ife_network_manager.dart';

class NetworkManagerOfDio with INetworkManager {
  static NetworkManagerOfDio? _instance;
  late final Dio _dio;

  static NetworkManagerOfDio? get instance {
    _instance ??= NetworkManagerOfDio._init();
    return _instance;
  }

  NetworkManagerOfDio._init() {
    _dio = Dio();
    //_dio.options.baseUrl = baseUrl;
    //_dio.options.connectTimeout = connectionTimeOut;
    //_dio.options.receiveTimeout = receivingTimeOut;

    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {},
    // onResponse: (response, handler) {},
    // onError: (error, handler) {}));
  }

  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final response = await _dio.request(path,
        data: data, options: Options(method: type.toMethod));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(true, data: model);
      default:
        return ResponseModel(false,
            error: ErrorModel(
                statusCode: response.statusCode.toString(),
                errorMessage: response.statusMessage.toString()));
    }
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(
      String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final response = await _dio.request(path,
        data: data, options: Options(method: type.toMethod));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(true, data: model);
      default:
        return ResponseModel(false,
            error: ErrorModel(
                statusCode: response.statusCode.toString(),
                errorMessage: response.statusMessage.toString()));
    }
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final response = await _dio.request(path,
        data: data, options: Options(method: type.toMethod));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(true, data: model);
      default:
        return ResponseModel(false,
            error: ErrorModel(
                statusCode: response.statusCode.toString(),
                errorMessage: response.statusMessage.toString()));
    }
  }
}
