import '../../../extension/exception_extension.dart';
import '../../../constants/enum/exception/exception_error_types_enum.dart';
import '../../../constants/enum/exception/exception_event_types_enum.dart';

abstract class IBaseExceptionModel {
  late String _timestamp;
  late String _errorBaseCode;
  late String _errorCode;
  late String _errorMessage;
  late String _errorTitle;

  IBaseExceptionModel(
      ExceptionErrorTypes errorTypes, ExceptionEventTypes eventTypes,
      {String? errorMessage}) {
    _errorBaseCode = errorTypes.toErrorCode;
    _errorCode = eventTypes.toErrorCode;
    _errorTitle = eventTypes.toErrorName + errorTypes.toErrorTitle;

    errorMessage != null
        ? _errorMessage = errorMessage
        : _errorMessage = eventTypes.toErrorMessage;
  }

  get timestamp => _timestamp;

  get errorCode => _errorBaseCode + _errorCode;

  get errorMessage => _errorMessage;

  get errorTitle => _errorTitle;
}
