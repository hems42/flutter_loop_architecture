import 'package:flutter_notebook/core/base/model/abstract/ife_base_network_model.dart';

class AlbumModel extends IBaseNetworkModel {
  int? _userId;
  int? _id;
  String? _title;

  AlbumModel({int? userId, int? id, String? title}) {
    if (userId != null) {
      _userId = userId;
    }
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;

  AlbumModel.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['id'] = _id;
    data['title'] = _title;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json["id"],
      title: json["title"]
    );
  }
}
