import '../../../constant/enum/exception/exception_event_types_enum.dart';


abstract class IBaseExceptionModel {

  late String _timeStamp;
  late String _errorTopicCode;
  late String _errorDetailCode;
  late String _errorMessage;
  late String _errorDescription;
  late String _baseErrorCode;
  late String _baseStatusCode;
  late ExceptionEventTypes _exceptionEventType;

  IBaseExceptionModel(ExceptionEventTypes exceptionEventType,
      {required String baseErrorCode,
      required String errorDetailCode,
      required String errorDescription,
      required String baseStatusCode}) {
    this._exceptionEventType = exceptionEventType;
    this._errorTopicCode = exceptionEventType.exceptionCode;
    this._errorMessage = exceptionEventType.exceptionMessage;
    this._errorDescription = errorDescription;
    this._baseErrorCode = baseErrorCode;
    this._errorDetailCode = errorDetailCode;
    this._baseStatusCode = baseStatusCode;
  }

  String get timeStamp => _timeStamp;

  String? get errorCode => _convertToSuperErrorCode();

  String? get errorMessage => _errorMessage;

  String? get errorDescription => _errorDescription;

  String? get statusCode => _baseStatusCode;

  ExceptionEventTypes get exceptionEventType => _exceptionEventType;

  String _convertToSuperErrorCode() {
    return _baseErrorCode + _errorTopicCode + _errorDetailCode;
  }

 @override
  String toString() {
    return """
              errorTopicCode   : $_errorTopicCode  
              errorDetailCode  : $_errorDetailCode
              errorMessage     : $_errorMessage
              errorDescription : $_errorDescription
              baseErrorCode    : $_baseErrorCode
              baseStatusCode   : $_baseStatusCode
              errorCode        : $errorCode
    """;
  }
}
