import '../../../core/constant/static/application_statics.dart';
import '../../../core/init/network/abstract/ife_network_service.dart';
import '../../../core/init/network/concrete/network_service.dart';

mixin AuthenticationNetworkServiceUtil {
  final String signupUrl = ApplicationConstants.SIGN_UP_URL;
  final String registerUrl = ApplicationConstants.REGISTER_URL;
  final String loginUrl = ApplicationConstants.LOGIN_URL;
  final String refreshTokenUrl = ApplicationConstants.REFRESH_TOKEN_URL;
  final String logoutUrl = ApplicationConstants.LOGOUT_URL;
  final String forgetPasswordUrl = ApplicationConstants.FORGET_PASSWORD_URL;
  final String resendEmailUrl = ApplicationConstants.RESEND_EMAIL_URL;
  final INetworService networkService = NetworkService.instance;
}
