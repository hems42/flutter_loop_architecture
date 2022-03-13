// ignore_for_file: overridden_fields
import '../abstract/ife_base_error_model.dart';
import '../abstract/ife_base_response_model.dart';

class ResponseModel<T> extends IBaseResponseModel<T> {
  ResponseModel(bool success, {T? data, IBaseErrorModel? error})
      : super(success, data: data, error: error);
}
