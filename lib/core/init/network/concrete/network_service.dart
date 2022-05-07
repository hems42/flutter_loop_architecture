// ignore_for_file: unused_field
import '../../../base/model/abstract/ife_base_response_model.dart';
import '../../../base/model/abstract/ife_base_network_model.dart';
import '../../../constant/enum/network/http_request_types_enum.dart';
import '../../../constant/enum/network/network_manager_types_enum.dart';
import "../abstract/ife_network_service.dart";
import '../abstract/ife_network_manager.dart';
import 'dio/network_manager_dio.dart';

class NetworkService implements INetworService {
  static NetworkService? _instance;
  late final INetworkManager _manager;

  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  NetworkService._init() {
    _manager = _selectManager(NetworkManagerTypesEnum.DIO)!;
  }

  INetworkManager? _selectManager(NetworkManagerTypesEnum types) {
    switch (types) {
      case NetworkManagerTypesEnum.DIO:
        return NetworkManagerOfDio.instance;

      default:
        return NetworkManagerOfDio.instance;
    }
  }

  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    return _manager.fetch(path, type: type, parseModel: parseModel);
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    return _manager.fetchNoNetwork(path, type: type, parseModel: parseModel);
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseNetworkModel>(
      String path,
      {required HttpRequestTypesEnum type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) {
    return _manager.send(path, type: type, parseModel: parseModel, data: data);
  }

  // post metod

  // get metod

  // put metod

  // patch metod

  // download metod

  // refreshtoken

  // access-token

}
