import 'package:flutter_notebook/core/init/network/abstract/ife_network_service.dart';

import '../../../base/model/abstract/ife_base_model.dart';
import '../../../base/model/abstract/ife_base_response_model.dart';
import '../../../constants/enum/http_request_types_enum.dart';

mixin INetworkManager implements INetworService{

Future<IBaseResponseModel<R>> fetch<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

  Future<IBaseResponseModel<R>> send<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(
      String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

}