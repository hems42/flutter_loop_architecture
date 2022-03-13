// ignore_for_file: unused_field
import '../../../constants/enum/network_manager_types_enum.dart';
import "../abstract/ife_network_service.dart";
import '../abstract/ife_network_manager.dart';
import 'dio/network_manager_dio.dart';

class NetworkService implements INetworService {
  static late final NetworkService? _instance;
  late final INetworkManager _manager;

  static NetworkService get instance {
    _instance ??= NetworkService._init();
    return _instance!;
  }

  NetworkService._init() {
    _manager = _selectManager(NetworkManagerTypes.DIO);
  }

  INetworkManager _selectManager(NetworkManagerTypes types) {
    switch (types) {
      case NetworkManagerTypes.DIO:
        return NetworkManagerOfDio.instance;

      default:
        return NetworkManagerOfDio.instance;
    }
  }

  // authentication...
  @override
  void signUpUser() {}

  @override
  void loginUser() {}

  @override
  void logOutUser() {}

  @override
  void register() {}

  @override
  void refreshToken() {}
}
