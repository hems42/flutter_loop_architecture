import 'package:flutter_notebook/core/base/model/abstract/ife_base_exception_model.dart';
import 'package:flutter_notebook/core/constants/enum/exception/exception_event_types_enum.dart';
import 'package:flutter_notebook/core/constants/enum/exception/exception_error_types_enum.dart';

class ExceptionModel extends IBaseExceptionModel{
  ExceptionModel(ExceptionErrorTypes errorTypes, ExceptionEventTypes eventTypes) : super(errorTypes, eventTypes);

}