import 'package:flutter_notebook/product/util/mixin/product_mixin_log_service.dart';

import '../../../product/util/mixin/product_mixin_network_service.dart';
import '../../../core/constant/static/app/application_statics.dart';

  class AuthenticationNetworkServiceUtil with ProductMixinNetwokService, ProductMixinLogService {
  final String signupUrl = ApplicationConstants.SIGN_UP_URL;
  final String registerUrl = ApplicationConstants.REGISTER_URL;
  final String loginUrl = ApplicationConstants.LOGIN_URL;
  final String refreshTokenUrl = ApplicationConstants.REFRESH_TOKEN_URL;
  final String logoutUrl = ApplicationConstants.LOGOUT_URL;
  final String forgetPasswordUrl = ApplicationConstants.FORGET_PASSWORD_URL;
  final String resendEmailUrl = ApplicationConstants.RESEND_EMAIL_URL;
}
