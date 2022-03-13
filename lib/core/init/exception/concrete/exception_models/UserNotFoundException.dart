import 'package:flutter_notebook/core/base/model/abstract/ife_base_exception_model.dart';
import 'package:flutter_notebook/core/constants/enum/exception_event_types_enum.dart';
import 'package:flutter_notebook/core/constants/enum/exception_error_types_enum.dart';

class UserNotFoundException extends IBaseExceptionModel {
  UserNotFoundException(ExceptionErrorTypes errorTypes, ExceptionEventTypes eventTypes) : super(errorTypes, eventTypes);
  
}