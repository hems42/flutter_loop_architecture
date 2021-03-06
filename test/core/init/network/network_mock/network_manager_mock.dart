import 'package:flutter_notebook/core/base/model/abstract/ife_base_response_model.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_network_model.dart';
import 'package:flutter_notebook/core/constant/enum/network/http_request_types_enum.dart';
import 'package:flutter_notebook/core/init/network/abstract/ife_network_manager.dart';

import '../../../mock/ife_core_mock.dart';

class NetworkManagerMock extends ICoreMock with INetworkManager {
  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    throw UnimplementedError();
  }
}
