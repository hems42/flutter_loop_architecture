import '../../../../../core/init/network/abstract/ife_network_service.dart';
import '../../../../../core/init/network/concrete/network_service.dart';
import '../../model/signup_request_model.dart';
import '../../model/signup_response_model.dart';

abstract class ISignupNetworkService {
  final String signupUrl = '/authentication/signup';
  final INetworService networkService = NetworkService.instance;
  Future<SignupResponseModel?> signup(SignupRequestModel signupRequestModel);
}
