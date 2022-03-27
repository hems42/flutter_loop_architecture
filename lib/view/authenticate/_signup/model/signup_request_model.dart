import '../../../../core/base/model/abstract/ife_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel extends IBaseModel<SignupRequestModel> {
  final String? userNickName;
  final String? email;
  final String? password;

  SignupRequestModel({this.userNickName, this.email, this.password});

  @override
  SignupRequestModel fromJson(Map<String, dynamic> json) {
    return _$SignupRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SignupRequestModelToJson(this);
  }
}
