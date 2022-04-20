// ignore_for_file: constant_identifier_names

class ApplicationMockConstants {

  // NETWORK SERVICE URL LIST
  static const API_BASE_URL = "http://localhost:8080/api";
  //-- authentication url:
  static const SIGN_UP_URL = API_BASE_URL + "/authentication/signup";
  static const REGISTER_URL = API_BASE_URL + "/authentication/registration";
  static const LOGIN_URL = API_BASE_URL + "/authentication/login";
  static const REFRESH_TOKEN_URL =
      API_BASE_URL + "/authentication/refreshToken";
  static const LOGOUT_URL = API_BASE_URL + "/authentication/logout";
  static const FORGET_PASSWORD_URL = "/authentication/_?";
  static const RESEND_EMAIL_URL = API_BASE_URL + "/authentication/_?";


  // NETWORK MOCK SERVICE URL LIST
  static const MOCK_API_BASE_URL = "http://localhost:8080/api";
  //-- authentication url:
  static const MOCK_SIGN_UP_URL = API_BASE_URL + "/authentication/signup";
  static const MOCK_REGISTER_URL = API_BASE_URL + "/authentication/registration";
  static const MOCK_LOGIN_URL = API_BASE_URL + "/authentication/login";
  static const MOCK_REFRESH_TOKEN_URL =
      MOCK_API_BASE_URL + "/authentication/refreshToken";
  static const MOCK_LOGOUT_URL = API_BASE_URL + "/authentication/logout";
  static const MOCK_FORGET_PASSWORD_URL = "/authentication/_?";
  static const MOCK_RESEND_EMAIL_URL = API_BASE_URL + "/authentication/_?";

}
