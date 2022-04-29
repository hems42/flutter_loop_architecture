import '../../../mock/ife_core_mock_model.dart';

class NetworkMockModel extends ICoreMockModel {
  String? _firstName;
  String? _lastName;
  int? _age;

  NetworkMockModel({String? firstName, String? lastName, int? age}) {
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (age != null) {
      this._age = age;
    }
  }

  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  int? get age => _age;
  set age(int? age) => _age = age;

  @override
  NetworkMockModel fromJson(Map<String, dynamic> json) {
    return NetworkMockModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age']);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['age'] = this._age;
    return data;
  }
}
