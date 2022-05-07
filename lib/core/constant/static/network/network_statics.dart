class NetworkConstants {
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