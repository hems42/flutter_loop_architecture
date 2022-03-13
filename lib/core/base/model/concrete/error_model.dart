import 'package:flutter_notebook/core/base/model/abstract/ife_base_error_model.dart';

class ErrorModel extends IBaseErrorModel {
  ErrorModel({required String errorMessage, required String statusCode}) : super(errorMessage: errorMessage, statusCode: statusCode);
}
