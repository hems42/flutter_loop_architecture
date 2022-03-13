// ignore_for_file: unnecessary_this, unused_field

abstract class IBaseErrorModel<T> {
  late final String _statusCode;
  late final String _errorMessage;
  IBaseErrorModel({required String errorMessage, required String statusCode}) {
    this._errorMessage = errorMessage;
    this._statusCode = statusCode;
  }
}
