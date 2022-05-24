import '../abstract/ife_base_exception_model.dart';

class ExceptionModel extends IBaseExceptionModel{
  ExceptionModel(super.exceptionEventType, 
  {required super.baseErrorCode,
   required super.errorDetailCode,
    required super.errorDescription,
     required super.baseStatusCode});

}