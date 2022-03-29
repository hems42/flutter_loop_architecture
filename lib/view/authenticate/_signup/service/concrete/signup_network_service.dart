import '../../../../../core/constants/enum/network/http_request_types_enum.dart';
import '../../model/signup_response_model.dart';
import '../../model/signup_request_model.dart';
import '../abstract/ife_signup_network_service.dart';

class SignupNetworkService extends ISignupNetworkService {
  @override
  Future<SignupResponseModel?> signup(
      SignupRequestModel signupRequestModel) async {
    final response = await networkService
        .send<SignupResponseModel, SignupResponseModel>('/authentication/signup',
            type: HttpRequestTypes.POST,
            parseModel: SignupResponseModel(),
            data: signupRequestModel);

    if (response.data is SignupResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
