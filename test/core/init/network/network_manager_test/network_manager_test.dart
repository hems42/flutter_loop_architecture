// ignore_for_file: unused_local_variable
import 'package:flutter_test/flutter_test.dart';

import '../network_mock/network_manager_mock.dart';
import '../network_mock/network_mock_model.dart';

void main() {
  final NetworkManagerMock networkManagerMock = NetworkManagerMock();
  final NetworkMockModel networkMockModel = NetworkMockModel();

  group("network manager infrastructure test", () {
    test(' -: internet connection status', () {
      final result = networkManagerMock.hasInternetnetConnection();
      expect(result, true);
    });

    test(' -: response parser metod work succesfully', () {
      final parseModel = NetworkMockModel.defaultResponseDataModel();
      final parsedModel =
          networkManagerMock.responseParser<NetworkMockModel, NetworkMockModel>(
              NetworkMockModel(), parseModel);

      expect(parsedModel, isNotNull);
      expect(parsedModel!.firstName, NetworkMockModel.defaultModel().firstName);
      expect(parsedModel.lastName, NetworkMockModel.defaultModel().lastName);
      expect(parsedModel.age, NetworkMockModel.defaultModel().age);

      final parseListModel = NetworkMockModel.defaultListResponseDataModel();
      final parsedListModel = networkManagerMock
          .responseParser<List<NetworkMockModel>, NetworkMockModel>(
              NetworkMockModel(), parseListModel);

      expect(parsedListModel, isNotNull);
      expect(parsedListModel, isList);
    });
  });

  group('network manager metods test', () {});
}
