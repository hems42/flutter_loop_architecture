import 'dart:io';
import '../../../../constant/static/exception/exception_error_code_statics.dart';
import '../../../../base/model/abstract/ife_base_exception_model.dart';
import '../../../../constant/enum/exception/exception_event_types_enum.dart';

class NotFoundException extends IBaseExceptionModel {
  NotFoundException(ExceptionEventTypes eventType,
      {required super.errorDetailCode, required super.errorDescription})
      : super(eventType,
            baseErrorCode:
                ExceptionErrorCodeCostants.B_NOT_FOUND_EXCEPTION_ERROR_CODE,
            baseStatusCode: HttpStatus.notFound.toString());
}
