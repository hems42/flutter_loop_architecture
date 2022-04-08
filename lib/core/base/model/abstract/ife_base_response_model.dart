// ignore_for_file: non_constant_identifier_names

import 'ife_base_error_model.dart';

abstract class IBaseResponseModel<T> {
  bool _success;
  T? _data;
  IBaseErrorModel? _error;

  IBaseResponseModel(this._success, {T? data, IBaseErrorModel? error}) {
    data != null ? _data = data : _data = null;
    error != null ? _error = error : _error = null;
  }

   bool get success => _success;

   set success(bool success) {
     _success = success;
   }

  get data => _data;

  get error => _error;
}
