import 'network_mock_model.dart';

class NetworkTestConstant{
  // default models
  static NetworkMockModel defaultModel() {
    return NetworkMockModel(
        firstName: 'firstName', lastName: 'lastName', age: 30);
  }

  static dynamic defaultResponseDataModel() {
    return defaultModel().toJson();
  }

  static List<NetworkMockModel> defaultListModel() {
    return List.filled(100, defaultModel());
  }

  static dynamic defaultListResponseDataModel() {
    return List.filled(100,defaultModel().toJson());
  }
}