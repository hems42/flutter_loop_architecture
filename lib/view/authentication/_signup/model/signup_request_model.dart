import '../../../../core/base/model/abstract/ife_base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel extends IBaseNetworkModel<SignupRequestModel> {
  final String? userNickName;
  final String? eMail;
  final String? password;

  SignupRequestModel({this.userNickName, this.eMail, this.password});

  @override
  SignupRequestModel fromJson(Map<String, dynamic> json) {
    return _$SignupRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SignupRequestModelToJson(this);
  }
}
