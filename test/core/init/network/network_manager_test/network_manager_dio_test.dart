// ignore_for_file: unused_local_variable
import 'package:flutter_notebook/core/constants/enum/network/http_request_types_enum.dart';
import 'package:flutter_notebook/core/init/network/abstract/ife_network_manager.dart';
import 'package:flutter_notebook/core/init/network/concrete/dio/network_manager_dio.dart';
import 'package:flutter_test/flutter_test.dart';

import '../network_mock/network_manager_mock.dart';

void main() {
  late final INetworkManager networkManager = NetworkManagerOfDio.instance!;
  late final NetworkManagerMock networkManagerMock = NetworkManagerMock();

  test('', () {
  //  networkManager.fetch<>(NetworkManagerMock.SIGN_UP_URL,
    // type: HttpRequestTypes.GET, parseModel: parseModel);
  });

  group('base networkmanager test', () {
    test('-: is internet connected', () {
      expect(networkManager.hasInternetnetConnection(), true);
    });

    test('-: is parser metod  work succesfully', () {
      //  final response = networkManager.responseParser(model, data)
    });
  });
}