import '../../../base/model/abstract/ife_base_network_model.dart';
import '../../../base/model/abstract/ife_base_response_model.dart';
import '../../../constant/enum/network/http_request_types_enum.dart';

abstract class INetworService {
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseNetworkModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

  Future<IBaseResponseModel<R>> send<R, T extends IBaseNetworkModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
