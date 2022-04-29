// ignore_for_file: unused_local_variable
import 'package:flutter_test/flutter_test.dart';

import '../network_mock/network_manager_mock.dart';
import '../network_mock/network_mock_model.dart';
import '../network_mock/network_test_constant.dart';

void main() {
  final NetworkManagerMock networkManagerMock = NetworkManagerMock();
  group("network manager infrastructure test", () {
    test(' -: internet connection status', () {
      final result = networkManagerMock.hasInternetnetConnection();
      expect(result, true);
    });

    test(' -: response parser metod work succesfully', () {
      final parseModel = NetworkTestConstant.defaultResponseDataModel();
      final parsedModel =
          networkManagerMock.responseParser<NetworkMockModel, NetworkMockModel>(
              NetworkMockModel(), parseModel);

      expect(parsedModel, isNotNull);
      expect(
          parsedModel!.firstName, NetworkTestConstant.defaultModel().firstName);
      expect(parsedModel.lastName, NetworkTestConstant.defaultModel().lastName);
      expect(parsedModel.age, NetworkTestConstant.defaultModel().age);

      final parseListModel = NetworkTestConstant.defaultListResponseDataModel();
      final parsedListModel = networkManagerMock
          .responseParser<List<NetworkMockModel>, NetworkMockModel>(
              NetworkMockModel(), parseListModel);

      expect(parsedListModel, isNotNull);
      expect(parsedListModel, isList);
    });
  });

  group('network manager metods test', () {});
}
