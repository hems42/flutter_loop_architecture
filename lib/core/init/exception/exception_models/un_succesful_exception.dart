import '../../../base/model/abstract/ife_base_exception_model.dart';
import '../../../constant/enum/exception/exception_event_types_enum.dart';
import '../../../constant/static/exception/exception_error_code_statics.dart';

class UnSuccessfulException extends IBaseExceptionModel {
  UnSuccessfulException(ExceptionEventTypes eventType,
      {required super.errorDetailCode, required super.errorDescription})
      : super(eventType,
            baseErrorCode:
                ExceptionErrorCodeCostants.B_UN_SUCCESSFUL_EXCEPTION_ERROR_CODE,
            baseStatusCode: "...");}
