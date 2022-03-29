// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestModel _$SignupRequestModelFromJson(Map<String, dynamic> json) =>
    SignupRequestModel(
      userNickName: json['userNickName'] as String?,
      eMail: json['eMail'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignupRequestModelToJson(SignupRequestModel instance) =>
    <String, dynamic>{
      'userNickName': instance.userNickName,
      'eMail': instance.eMail,
      'password': instance.password,
    };
