import '../abstract/ife_base_error_model.dart';

class ErrorModel extends IBaseErrorModel {
  final String? errorDescription;
  final String errorMessage;
  final String? errorCode;
  final String? timestamp;

  ErrorModel({
    this.errorDescription,
    this.errorCode,
    this.timestamp,
    required this.errorMessage, required String statusCode})
      : super(errorMessage: errorMessage, statusCode: statusCode);
}
