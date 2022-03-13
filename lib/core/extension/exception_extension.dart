import '../constants/enum/exception_error_types_enum.dart';
import '../constants/enum/exception_event_types_enum.dart';

extension ExtensionOfExceptionErrorTypes on ExceptionErrorTypes {

  String get toErrorCode {

    switch (this) {
      case ExceptionErrorTypes.NOT_FOUND:
        return "404";
        
      default:
      return "000";
    }
  }

  String get toErrorTitle {

    switch (this) {
      case ExceptionErrorTypes.NOT_FOUND:
        return "NOT_FOUND_EXCEPTION";
        
      default:
      return "EXCEPTION";
    }
  }
  // to error code
  // to error title
  //

}

extension ExtensionOfExceptEventTypes on ExceptionEventTypes {

  String get toErrorCode {

    switch (this) {
      case ExceptionEventTypes.NOT_FOUND_USER:
        return "100";
        
      default:
      return "111";
    }
  }

  String get toErrorName {

    switch (this) {
      case ExceptionEventTypes.NOT_FOUND_USER:
        return "USER_";
        
      default:
      return "";
    }
  }


    String get toErrorMessage {

    switch (this) {
      case ExceptionEventTypes.NOT_FOUND_USER:
        return "not found user";
        
      default:
      return "";
    }
  }
  // to error code
  // to error message
  //
}
