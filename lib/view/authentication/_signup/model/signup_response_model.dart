import 'package:flutter_notebook/core/base/model/abstract/ife_base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel extends IBaseNetworkModel<SignupResponseModel> {
  final String? accessToken;
  final String? refreshToken;
  final String? userId;
  final String? nickName;
  final String? email;
  final String? password;
  final bool? active;
  final bool? registered;

  SignupResponseModel(
      {this.accessToken,
      this.refreshToken,
      this.userId,
      this.nickName,
      this.email,
      this.password,
      this.active,
      this.registered});

  @override
  SignupResponseModel fromJson(Map<String, dynamic> json) {
    return _$SignupResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SignupResponseModelToJson(this);
  }
}
