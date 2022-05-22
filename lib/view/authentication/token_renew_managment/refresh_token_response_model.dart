import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/abstract/ife_base_network_model.dart';

part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponseModel
    extends IBaseNetworkModel<RefreshTokenResponseModel> {
  String? refreshToken;
  String? accessToken;
  bool? isValid;
  bool? isChanged;

  RefreshTokenResponseModel(
      {this.refreshToken, this.accessToken, this.isValid, this.isChanged});

  @override
  RefreshTokenResponseModel fromJson(Map<String, dynamic> json) {
    return _$RefreshTokenResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RefreshTokenResponseModelToJson(this);
  }
}
