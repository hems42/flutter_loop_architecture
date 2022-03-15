import 'package:flutter_notebook/core/base/model/abstract/ife_base_model.dart';

class PhotoModel extends IBaseModel {
  int? _albumId;
  int? _id;
  String? _title;
  String? _url;
  String? _thumbnailUrl;

  PhotoModel(
      {int? albumId,
      int? id,
      String? title,
      String? url,
      String? thumbnailUrl}) {
    if (albumId != null) {
      _albumId = albumId;
    }
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (url != null) {
      _url = url;
    }
    if (thumbnailUrl != null) {
      _thumbnailUrl = thumbnailUrl;
    }
  }

  int? get albumId => _albumId;
  set albumId(int? albumId) => _albumId = albumId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get thumbnailUrl => _thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _thumbnailUrl = thumbnailUrl;

  PhotoModel.fromJson(Map<String, dynamic> json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = _albumId;
    data['id'] = _id;
    data['title'] = _title;
    data['url'] = _url;
    data['thumbnailUrl'] = _thumbnailUrl;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return PhotoModel(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}
