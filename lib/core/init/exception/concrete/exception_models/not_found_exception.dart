import '../../../../base/model/abstract/ife_base_exception_model.dart';
import 'package:flutter_notebook/core/constants/enum/exception_event_types_enum.dart';
import 'package:flutter_notebook/core/constants/enum/exception_error_types_enum.dart';

class NotFoundException extends IBaseExceptionModel {
  NotFoundException(ExceptionEventTypes eventTypes,{String? errorMessage}) 
  : super(ExceptionErrorTypes.NOT_FOUND,
   eventTypes,
   errorMessage: errorMessage);
  
}