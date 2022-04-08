// ignore_for_file: constant_identifier_names

class ApplicationConstants {
  static const COMPANY_NAME = 'HWA';
  // production'da olmadığımız sürece çalışmasını istemediğimiz fonksiyonlar için kullanacağız
  static const TEST_MODE = true;
  static const LANG_ASSET_PATH = 'asset/lang';
  static const IPAD_NAME = 'IPAD';
  static const FONT_FAMILY = 'POPPINS';
  static const EMAIL_REGIEX = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$';
  static const APP_WEB_SITE = '';

  // NETWORK SERVICE URL LIST
  static const API_BASE_URL = "http://localhost:8080/api";
  //-- authentication url:
  static const SIGN_UP_URL = "/authentication/signup";
  static const REGISTER_URL = "/authentication/registration";
  static const LOGIN_URL = "/authentication/login";
  static const REFRESH_TOKEN_URL = "/authentication/refreshToken";
  static const LOGOUT_URL = "/authentication/logout";
  static const FORGET_PASSWORD_URL = "/authentication/_?";
  static const RESEND_EMAIL_URL = "/authentication/_?";
}
