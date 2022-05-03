import 'package:dio/dio.dart';
import 'dart:io';
import '../../../../base/model/concrete/error_response_model.dart';
import '../../../../base/model/concrete/response_model.dart';
import '../../../../constant/enum/network/http_request_types_enum.dart';
import '../../../../extension/network_extension.dart';
import '../../../../base/model/abstract/ife_base_network_model.dart';
import '../../../../base/model/abstract/ife_base_response_model.dart';
import '../../../../base/model/concrete/error_model.dart';
import '../../abstract/ife_network_manager.dart';

part 'network_manager_dio_util.dart';

class NetworkManagerOfDio with INetworkManager {
  static NetworkManagerOfDio? _instance;
  late final Dio _dio;

  static NetworkManagerOfDio? get instance {
    _instance ??= NetworkManagerOfDio._init();
    return _instance;
  }

  NetworkManagerOfDio._init() {
    _dio = Dio();
  //  _dio.options.baseUrl = baseUrl;
    //_dio.options.connectTimeout = connectionTimeOut;
    //_dio.options.receiveTimeout = receivingTimeOut;

    _dio.interceptors.add(InterceptorsWrapper(
      
      onError: (error, handler) {
      var foundFlag = error.response!.headers.value("errorflag");

      if (foundFlag == "true") {
        var model = responseParser<ErrorResponseModel, ErrorResponseModel>(
            ErrorResponseModel(), error.response!.data);
        model!.statusCode = error.response!.statusCode.toString();
        error.type = DioErrorType.other;

        error.error = model;
      }

      //  return handler.next(error);
      // print("gelen hata error : " + error.response!.data);

/*
      throw ErrorResponseModel(
        statusCode: error.response!.statusCode.toString(),
        errorCode: model!.errorCode,
        errorDescription: model.errorDescription,
        errorMessage: model.errorMessage,
        timestamp: model.timestamp
      );
      */

      handler.next(error);

      //throw NotFoundException(ExceptionEventTypes.NOT_FOUND_USER);

      //  throw ErrorResponseModel();
    }));
  }

  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseNetworkModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    return _getResponseFromRequest(path, type: type, parseModel: parseModel, data: data);
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    return _getResponseFromRequest(path, type: type, parseModel: parseModel);
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseNetworkModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    return _getResponseFromRequest(path,
        data: data, type: type, parseModel: parseModel);
  }

  Future<IBaseResponseModel<R>>
      _getResponseFromRequest<R, T extends IBaseNetworkModel>(String path,
          {required HttpRequestTypes type,
          required T parseModel,
          dynamic data,
          Map<String, Object>? queryParameters,
          void Function(int p1, int p2)? onReceiveProgress}) async {
    try {
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
    } on DioError catch (e) {
      var foundFlag = e.response!.headers.value("errorflag");
      var error = foundFlag != null ? e.error as ErrorResponseModel : e.error;
      throw error;
    }
  }
}
