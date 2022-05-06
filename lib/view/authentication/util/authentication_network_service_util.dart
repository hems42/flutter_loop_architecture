import '../../../product/base/ife_base_product_service.dart';
import '../../../core/constant/static/app/application_statics.dart';

abstract class AuthenticationNetworkServiceUtil extends IBaseProductService {
  final String signupUrl = ApplicationConstants.SIGN_UP_URL;
  final String registerUrl = ApplicationConstants.REGISTER_URL;
  final String loginUrl = ApplicationConstants.LOGIN_URL;
  final String refreshTokenUrl = ApplicationConstants.REFRESH_TOKEN_URL;
  final String logoutUrl = ApplicationConstants.LOGOUT_URL;
  final String forgetPasswordUrl = ApplicationConstants.FORGET_PASSWORD_URL;
  final String resendEmailUrl = ApplicationConstants.RESEND_EMAIL_URL;
}
