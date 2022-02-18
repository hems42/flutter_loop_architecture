// ignore_for_file: unused_field

import 'package:flutter_notebook/core/constants/enum/http_request_types_enum.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_response_model.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_model.dart';
import 'package:flutter_notebook/core/constants/enum/network_manager_types_enum.dart';
import 'package:flutter_notebook/core/init/network/abstract/ife_network_service.dart';
import 'package:flutter_notebook/core/init/network/concrete/dio/network_manager_dio.dart';

class NetworkService implements INetworService {
  static late final  NetworkService? _instance;
  late final INetworService _service;
  static NetworkService get instance {
  
    _instance ??= NetworkService._init();
    return _instance!;
  }

  NetworkService._init() {
    _service = _selectService(NetworkManagerTypes.DIO);
  }

  INetworService _selectService(NetworkManagerTypes types) {
    switch (types) {
      case NetworkManagerTypes.DIO:
        return NetworkManagerOfDio.instance;

      default:
        return NetworkManagerOfDio.instance;
    }
  }

  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseModel>(String path, {required HttpRequestTypes type, required T parseModel, data, Map<String, Object>? queryParameters, void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(String path, {required HttpRequestTypes type, required T parseModel, data, Map<String, Object>? queryParameters, void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement fetchNoNetwork
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseModel>(String path, {required HttpRequestTypes type, required T parseModel, data, Map<String, Object>? queryParameters, void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement send
    throw UnimplementedError();
  }
}
