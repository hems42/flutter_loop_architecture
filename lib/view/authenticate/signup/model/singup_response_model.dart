// ignore_for_file: unnecessary_getters_setters

import '../../../../core/base/model/abstract/ife_base_model.dart';

class SignupResponse extends IBaseModel {
  String? _accessToken;
  String? _refreshToken;
  User? _user;

  SignupResponse({String? accessToken, String? refreshToken, User? user}) {
    if (accessToken != null) {
      _accessToken = accessToken;
    }
    if (refreshToken != null) {
      _refreshToken = refreshToken;
    }
    if (user != null) {
      _user = user;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  String? get refreshToken => _refreshToken;
  set refreshToken(String? refreshToken) => _refreshToken = refreshToken;
  User? get user => _user;
  set user(User? user) => _user = user;

  SignupResponse.fromJson(Map<String, dynamic> json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = _accessToken;
    data['refreshToken'] = _refreshToken;
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}

class User {
  String? _id;
  String? _nickName;
  String? _email;
  String? _password;
  List<Roles>? _roles;
  String? _createdDate;
  String? _updatedDate;
  bool? _active;
  bool? _registered;

  User(
      {String? id,
      String? nickName,
      String? email,
      String? password,
      List<Roles>? roles,
      String? createdDate,
      String? updatedDate,
      bool? active,
      bool? registered}) {
    if (id != null) {
      _id = id;
    }
    if (nickName != null) {
      _nickName = nickName;
    }
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
    if (roles != null) {
      _roles = roles;
    }
    if (createdDate != null) {
      _createdDate = createdDate;
    }
    if (updatedDate != null) {
      _updatedDate = updatedDate;
    }
    if (active != null) {
      _active = active;
    }
    if (registered != null) {
      _registered = registered;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get nickName => _nickName;
  set nickName(String? nickName) => _nickName = nickName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  List<Roles>? get roles => _roles;
  set roles(List<Roles>? roles) => _roles = roles;
  String? get createdDate => _createdDate;
  set createdDate(String? createdDate) => _createdDate = createdDate;
  String? get updatedDate => _updatedDate;
  set updatedDate(String? updatedDate) => _updatedDate = updatedDate;
  bool? get active => _active;
  set active(bool? active) => _active = active;
  bool? get registered => _registered;
  set registered(bool? registered) => _registered = registered;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nickName = json['nickName'];
    _email = json['email'];
    _password = json['password'];
    if (json['roles'] != null) {
      _roles = <Roles>[];
      json['roles'].forEach((v) {
        _roles!.add(Roles.fromJson(v));
      });
    }
    _createdDate = json['createdDate'];
    _updatedDate = json['updatedDate'];
    _active = json['active'];
    _registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['nickName'] = _nickName;
    data['email'] = _email;
    data['password'] = _password;
    if (_roles != null) {
      data['roles'] = _roles!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = _createdDate;
    data['updatedDate'] = _updatedDate;
    data['active'] = _active;
    data['registered'] = _registered;
    return data;
  }
}

class Roles {
  int? _rolId;
  String? _roleName;
  String? _roleDescription;
  String? _createdDate;
  Null? _updatedDate;

  Roles(
      {int? rolId,
      String? roleName,
      String? roleDescription,
      String? createdDate,
      Null? updatedDate}) {
    if (rolId != null) {
      _rolId = rolId;
    }
    if (roleName != null) {
      _roleName = roleName;
    }
    if (roleDescription != null) {
      _roleDescription = roleDescription;
    }
    if (createdDate != null) {
      _createdDate = createdDate;
    }
    if (updatedDate != null) {}
  }

  int? get rolId => _rolId;
  set rolId(int? rolId) => _rolId = rolId;
  String? get roleName => _roleName;
  set roleName(String? roleName) => _roleName = roleName;
  String? get roleDescription => _roleDescription;
  set roleDescription(String? roleDescription) =>
      _roleDescription = roleDescription;
  String? get createdDate => _createdDate;
  set createdDate(String? createdDate) => _createdDate = createdDate;
  Null? get updatedDate => _updatedDate;
  set updatedDate(Null? updatedDate) => _updatedDate = updatedDate;

  Roles.fromJson(Map<String, dynamic> json) {
    _rolId = json['rolId'];
    _roleName = json['roleName'];
    _roleDescription = json['roleDescription'];
    _createdDate = json['createdDate'];
    _updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rolId'] = _rolId;
    data['roleName'] = _roleName;
    data['roleDescription'] = _roleDescription;
    data['createdDate'] = _createdDate;
    data['updatedDate'] = _updatedDate;
    return data;
  }
}
