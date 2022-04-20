// ignore_for_file: unused_local_variable
import 'package:flutter_notebook/core/base/model/abstract/ife_base_error_model.dart';
import 'package:flutter_notebook/core/base/model/concrete/error_response_model.dart';
import 'package:flutter_notebook/core/constants/enum/network/http_request_types_enum.dart';
import 'package:flutter_notebook/core/init/network/abstract/ife_network_manager.dart';
import 'package:flutter_notebook/core/init/network/concrete/dio/network_manager_dio.dart';
import 'package:flutter_notebook/view/authentication/_signup/model/signup_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../network_mock/network_manager_mock.dart';

void main() {
  late final INetworkManager networkManager = NetworkManagerOfDio.instance!;
  late final NetworkManagerMock networkManagerMock = NetworkManagerMock();

  group('internet connection available status', () {});

  group('internet connection not available status', () {});
  
  test('dff', () async {
    try {
      final response = await networkManager.fetch<SignupResponseModel,
              SignupResponseModel>(NetworkManagerMock.SIGN_UP_URL,
          type: HttpRequestTypes.POST,
          parseModel: SignupResponseModel(),
          data: {"userNickName": "ali", "eMail": "ali@ali", "password": "ali"});
    } on ErrorResponseModel catch (e) {
      expect(e.errorCode, IBaseErrorModel);
    }

    // response;
  });
}
