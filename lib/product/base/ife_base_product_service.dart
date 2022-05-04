import '../../core/init/network/abstract/ife_network_service.dart';
import '../../core/init/network/concrete/network_service.dart';

abstract class IBaseProductService {
  final INetworService _networService = NetworkService.instance;

  get networkService => _networService;
}
