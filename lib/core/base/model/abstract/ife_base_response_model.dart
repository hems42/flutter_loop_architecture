import 'ife_base_error_model.dart';

abstract class IBaseResponseModel<T> {
  T? data;
  IBaseErrorModel? error;
}