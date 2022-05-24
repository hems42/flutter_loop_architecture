import '../../static/exception/exception_error_code_statics.dart';

enum ExceptionEventTypes {
  //AUTHENTICATION***

  // ACCESS TOKEN
  NOT_VALID_ACCESS_TOKEN(
      "NOT_VALID_ACCESS_TOKEN", ExceptionErrorCodeCostants.T_ACCESS_TOKEN),

  //LOGIN
  UN_SUCCESSFUL_RENEW_REFRESH_TOKEN("UN_SUCCESSFUL_RENEW_REFRESH_TOKEN",
      ExceptionErrorCodeCostants.T_REFRESH_TOKEN),

  //REGISTRATION
  UN_SUCCESSFUL_REGISTRATION(
      "UN_SUCCESSFUL_REGISTRATION", ExceptionErrorCodeCostants.T_REGISTRATION),

  //SIGNUP
  UN_SUCCESSFUL_SIGNUP(
      "UN_SUCCESSFUL_SIGNUP", ExceptionErrorCodeCostants.T_SIGNUP),

  //LOGIN
  UN_SUCCESSFUL_LOGIN(
      "UN_SUCCESSFUL_LOGIN", ExceptionErrorCodeCostants.T_LOGIN);

  final String exceptionMessage;
  final String exceptionCode;

  const ExceptionEventTypes(this.exceptionMessage, this.exceptionCode);

  String get toErrorCode => exceptionCode;
  String get toErrorName => exceptionMessage;
}
