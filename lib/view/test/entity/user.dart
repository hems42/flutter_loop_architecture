class User {
  String? _id;
  bool? _active;
  String? _createdDate;
  String? _email;
  String? _nickName;
  String? _password;
  bool? _registered;
  String? _updatedDate;

  User(
      {String? id,
      bool? active,
      String? createdDate,
      String? email,
      String? nickName,
      String? password,
      bool? registered,
      String? updatedDate}) {
    if (id != null) {
      _id = id;
    }
    if (active != null) {
      _active = active;
    }
    if (createdDate != null) {
      _createdDate = createdDate;
    }
    if (email != null) {
      _email = email;
    }
    if (nickName != null) {
      _nickName = nickName;
    }
    if (password != null) {
      _password = password;
    }
    if (registered != null) {
      _registered = registered;
    }
    if (updatedDate != null) {
      _updatedDate = updatedDate;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  bool? get active => _active;
  set active(bool? active) => _active = active;
  String? get createdDate => _createdDate;
  set createdDate(String? createdDate) => _createdDate = createdDate;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get nickName => _nickName;
  set nickName(String? nickName) => _nickName = nickName;
  String? get password => _password;
  set password(String? password) => _password = password;
  bool? get registered => _registered;
  set registered(bool? registered) => _registered = registered;
  String? get updatedDate => _updatedDate;
  set updatedDate(String? updatedDate) => _updatedDate = updatedDate;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _active = json['active'];
    _createdDate = json['createdDate'];
    _email = json['email'];
    _nickName = json['nickName'];
    _password = json['password'];
    _registered = json['registered'];
    _updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['active'] = _active;
    data['createdDate'] = _createdDate;
    data['email'] = _email;
    data['nickName'] = _nickName;
    data['password'] = _password;
    data['registered'] = _registered;
    data['updatedDate'] = _updatedDate;
    return data;
  }
}
