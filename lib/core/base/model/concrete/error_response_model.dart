// ignore_for_file: unused_field
import 'package:json_annotation/json_annotation.dart';
import '../abstract/ife_base_exception_model.dart';
import '../abstract/ife_base_model.dart';

part 'error_response_model.g.dart';

@JsonSerializable()
class ErrorResponseModel extends IBaseModel implements IBaseExceptionModel {
  late String? statusCode;
  final String? errorDescription;
  final String? errorMessage;
  final String? errorCode;
  final String? timestamp;

  ErrorResponseModel(
      {this.statusCode,
      this.errorDescription,
      this.errorMessage,
      this.errorCode,
      this.timestamp});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ErrorResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ErrorResponseModelToJson(this);
  }

  @override
  get errorTitle => "jjj";

  @override
  String toString() {
    return "statusCode :  $statusCode \n" +
        "errorDescription : $errorDescription \n" +
        "errorMessage : $errorMessage \n" +
        "errorCode : $errorCode \n" +
        "timestamp : $timestamp";
  }
}
