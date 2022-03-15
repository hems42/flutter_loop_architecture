import 'package:flutter_notebook/core/init/network/abstract/ife_network_service.dart';
import 'package:flutter_notebook/core/init/network/concrete/network_service.dart';

abstract class IBaseService {
  final INetworService _networService = NetworkService.instance;

  get networkService => _networService;
}
