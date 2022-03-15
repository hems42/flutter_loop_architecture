// ignore_for_file: unused_field
import 'package:flutter_notebook/core/constants/enum/http_request_types_enum.dart';

import 'package:flutter_notebook/core/base/model/abstract/ife_base_response_model.dart';

import 'package:flutter_notebook/core/base/model/abstract/ife_base_model.dart';

import '../../../constants/enum/network_manager_types_enum.dart';
import "../abstract/ife_network_service.dart";
import '../abstract/ife_network_manager.dart';
import 'dio/network_manager_dio.dart';

class NetworkService implements INetworService {
  static  NetworkService? _instance;
  late final INetworkManager _manager;

  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  NetworkService._init() {
    _manager = _selectManager(NetworkManagerTypes.DIO)!;
  }

  INetworkManager? _selectManager(NetworkManagerTypes types) {
    switch (types) {
      case NetworkManagerTypes.DIO:
        return NetworkManagerOfDio.instance;

      default:
        return NetworkManagerOfDio.instance;
    }
  }

  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    return _manager.fetch(path, type: type, parseModel: parseModel);
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(
      String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    throw UnimplementedError();
  }
}
