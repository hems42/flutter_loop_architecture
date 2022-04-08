import '../../../util/authentication_network_service.dart';
import '../../model/signup_request_model.dart';
import '../../model/signup_response_model.dart';

abstract class ISignupNetworkService with AuthenticationNetworkService {
  Future<SignupResponseModel?> signup(SignupRequestModel signupRequestModel);

}
