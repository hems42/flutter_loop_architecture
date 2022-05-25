// ignore_for_file: unused_field, unused_element
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../view/authentication/token_renew_managment/refresh_token_response_model.dart';
import '../../../../base/model/concrete/error_response_model.dart';
import '../../../../base/model/concrete/response_model.dart';
import '../../../../constant/enum/network/http_request_types_enum.dart';
import '../../../../base/model/abstract/ife_base_network_model.dart';
import '../../../../base/model/abstract/ife_base_response_model.dart';
import '../../../../base/model/concrete/error_model.dart';
import '../../abstract/ife_network_manager.dart';

class NetworkManagerOfDio with INetworkManager {
  String? accessToken;
  String? currentEmail;
  static NetworkManagerOfDio? _instance;
  late final Dio _dio;

  static NetworkManagerOfDio? get instance {
    _instance ??= NetworkManagerOfDio._init();
    return _instance;
  }

  NetworkManagerOfDio._init() {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = connectionTimeOut;
    _dio.options.receiveTimeout = receivingTimeOut;

    cacheService.getAccessToken().then((value) => accessToken = value);

    _dio.interceptors.add(QueuedInterceptorsWrapper(
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          if (await updateAccessToken() == true) {
            var retryResponse = await _retry(error.requestOptions, _dio);
            return handler.resolve(retryResponse);
          } else {
            return handler.next(error);
          }
        } else if (error.response!.headers.value("errorflag") == "true") {
          var model = responseParser<ErrorResponseModel, ErrorResponseModel>(
              ErrorResponseModel(), error.response!.data);
          model!.statusCode = error.response!.statusCode.toString();
          error.type = DioErrorType.other;
          error.error = model;
        }

        handler.next(error);
      },
      onRequest: (requestOption, handler) async {
        requestOption.headers['Authorization'] =
            'Bearer ${await cacheService.getAccessToken()}';
        return handler.next(requestOption);
      },
    ));
  }

  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    return _getResponseFromRequest(path,
        type: type, parseModel: parseModel, data: data);
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    return _getResponseFromRequest(path, type: type, parseModel: parseModel);
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    return _getResponseFromRequest(path,
        data: data, type: type, parseModel: parseModel);
  }

  Future<IBaseResponseModel<R>>
      _getResponseFromRequest<R, T extends IBaseNetworkModel>(String path,
          {required HttpRequestTypesEnum type,
          required T parseModel,
          dynamic data,
          Map<String, Object>? queryParameters,
          void Function(int p1, int p2)? onReceiveProgress}) async {
    try {
      final response = await _dio.request(path,
          data: data, options: Options(method: type.name));

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

  // util metod
  Future<bool> updateAccessToken() async {
    final refreshToken = await cacheService
    .getRefreshToken(checkEmail: (email) => currentEmail = email);
    if (refreshToken != null) {
      IBaseResponseModel response =
          await fetch<RefreshTokenResponseModel, RefreshTokenResponseModel>(
              refreshTokenUrl + "?refreshToken=$refreshToken",
              type: HttpRequestTypesEnum.GET,
              parseModel: RefreshTokenResponseModel());

      if (response.success == true) {
        var refreshTokenResponse = response.data as RefreshTokenResponseModel;
        await cacheService
            .saveAccesToken(refreshTokenResponse.accessToken.toString());
        return true;
      } else {
        await cacheService.deleteAccesToken(email: currentEmail);
        await cacheService.deleteRefreshToken(email: currentEmail);
        return false;
      }
    } else {
      await cacheService.deleteAccesToken(email: currentEmail);
      await cacheService.deleteRefreshToken(email: currentEmail);
      return false;
    }
  }

  Future<Response<dynamic>> _retry(
      RequestOptions requestOptions, Dio dio) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
