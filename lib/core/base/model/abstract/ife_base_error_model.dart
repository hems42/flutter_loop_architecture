// ignore_for_file: unnecessary_this, unused_field

abstract class IBaseErrorModel<T> {
  void statusCode() {}
  late final  String _errorMessage;
  IBaseErrorModel({
    required String errorMessage,
  }) {
    this._errorMessage = errorMessage;
  }
}
