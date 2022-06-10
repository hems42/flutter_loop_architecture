import '../../../core/constant/static/network/network_statics.dart';
import '../../../product/util/mixin/product_mixin_log_service.dart';
import '../../../product/util/mixin/product_mixin_network_service.dart';

class AuthenticationNetworkServiceUtil
    with ProductMixinNetwokService, ProductMixinLogService {
  final String signupUrl = NetworkConstants.API_BASE_MOCK_URL + NetworkConstants.SIGN_UP_URL;
  final String registerUrl = NetworkConstants.REGISTER_URL;
  final String loginUrl = NetworkConstants.LOGIN_URL;
  final String refreshTokenUrl = NetworkConstants.REFRESH_TOKEN_URL;
  final String logoutUrl = NetworkConstants.LOGOUT_URL;
  final String forgetPasswordUrl = NetworkConstants.FORGET_PASSWORD_URL;
  final String resendEmailUrl = NetworkConstants.RESEND_EMAIL_URL;
}
