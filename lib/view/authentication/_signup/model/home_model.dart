import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/abstract/ife_base_network_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends IBaseNetworkModel<HomeModel> {
  final String? name;
  final int? roomNumber;
  HomeModel({this.name, this.roomNumber});

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }

  @override
  String toString() {
    return "name : $name --  roomNumber : $roomNumber";
  }
}
