import '../../../util/authentication_network_service_util.dart';
import '../../model/signup_request_model.dart';
import '../../model/signup_response_model.dart';

abstract class ISignupNetworkService with AuthenticationNetworkServiceUtil {
  Future<SignupResponseModel?> signup(SignupRequestModel signupRequestModel);

}
