import '../abstract/ife_base_exception_model.dart';
import '../../../constant/enum/exception/exception_error_types_enum.dart';
import '../../../constant/enum/exception/exception_event_types_enum.dart';

class ExceptionModel extends IBaseExceptionModel{
  ExceptionModel(ExceptionErrorTypes errorTypes, ExceptionEventTypes eventTypes) : super(errorTypes, eventTypes);

}