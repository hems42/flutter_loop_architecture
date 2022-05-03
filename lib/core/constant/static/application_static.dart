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

  // CACHE SERVICE
  static const String CACHE_FOLDER_NAME = 'application _of_cache_box';
  static const String CACHE_AUTHENTICATION_NAME = 'authentication';

  // NETWORK SERVICE URL LIST
  static const API_BASE_URL = "http://localhost:8080/api";
  //-- authentication url:
  static const SIGN_UP_URL = "https://69f648e2-5a86-4a7f-ab23-6b9121fab04f.mock.pstmn.io" + "/authentication/signup";
  static const REGISTER_URL = API_BASE_URL + "/authentication/registration";
  static const LOGIN_URL = API_BASE_URL + "/authentication/login";
  static const REFRESH_TOKEN_URL =
      API_BASE_URL + "/authentication/refreshToken";
  static const LOGOUT_URL = API_BASE_URL + "/authentication/logout";
  static const FORGET_PASSWORD_URL = "/authentication/_?";
  static const RESEND_EMAIL_URL = API_BASE_URL + "/authentication/_?";
}
