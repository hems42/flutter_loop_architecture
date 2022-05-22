// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponseModel(
      refreshToken: json['refreshToken'] as String?,
      accessToken: json['accessToken'] as String?,
      isValid: json['isValid'] as bool?,
      isChanged: json['isChanged'] as bool?,
    );

Map<String, dynamic> _$RefreshTokenResponseModelToJson(
        RefreshTokenResponseModel instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
      'isValid': instance.isValid,
      'isChanged': instance.isChanged,
    };
