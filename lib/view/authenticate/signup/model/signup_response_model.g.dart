// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      userId: json['userId'] as String?,
      nickName: json['nickName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      active: json['active'] as bool?,
      registered: json['registered'] as bool?,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
        SignupResponseModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'nickName': instance.nickName,
      'email': instance.email,
      'password': instance.password,
      'active': instance.active,
      'registered': instance.registered,
    };
