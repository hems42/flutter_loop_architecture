import 'package:dio/dio.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_model.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_response_model.dart';
import 'package:flutter_notebook/core/constants/app/app_constant.dart';
import 'package:flutter_notebook/core/constants/enum/http_request_types_enum.dart';

import '../../abstract/ife_network_manager.dart';

class NetworkManagerOfDio with INetworkManager {
  static late NetworkManagerOfDio _instance;
  var _dio;

  static NetworkManagerOfDio get instance {
    // ignore: unnecessary_null_comparison
    if (_instance == null) NetworkManagerOfDio._init();
    return _instance;
  }

  NetworkManagerOfDio._init() {
    _dio = Dio();
    _dio.options.baseUrl = ApplicationConstants.API_BASE_URL;
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
  }

  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(
      String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement fetchNoNetwork
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement send
    throw UnimplementedError();
  }

  @override
  void logOutUser() {
    // TODO: implement logOutUser
  }

  @override
  void loginUser() {
    // TODO: implement loginUser
  }

  @override
  void signUpUser() {
    // TODO: implement signUpUser
  }
}
