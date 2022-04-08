// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      statusCode: json['statusCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorDescription': instance.errorDescription,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
      'timestamp': instance.timestamp,
    };
