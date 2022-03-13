import 'package:flutter_notebook/core/constants/enum/exception_error_types_enum.dart';
import 'package:flutter_notebook/core/constants/enum/exception_event_types_enum.dart';

abstract class IBaseExceptionModel {
  late String _timestamp;
  late String _errorBaseCode;
  late String _errorCode;
  late String errorMessage;
  late String _errorTitle;

  IBaseExceptionModel(
      ExceptionErrorTypes errorTypes, ExceptionEventTypes eventTypes) {
    _errorBaseCode = "";
    _errorCode = "";
    _errorTitle = "";
  }
}
