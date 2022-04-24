// ignore_for_file: unused_local_variable

import 'package:flutter_notebook/core/base/model/abstract/ife_base_error_model.dart';
import 'package:flutter_notebook/core/constants/enum/network/http_request_types_enum.dart';
import 'package:flutter_notebook/core/init/network/abstract/ife_network_service.dart';
import 'package:flutter_notebook/core/init/network/concrete/network_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock/app_mock_constant.dart';
import '../network_mock/network_mock_model.dart';

void main() {
  late INetworService networkService = NetworkService.instance;

  group("network service base requirrements", () {
    test(" -: fetch get metod test", () async {
      final response =
          await networkService.fetch<NetworkMockModel, NetworkMockModel>(
              ApplicationMockConstants.MOCK_TEST_GET_URL,
              type: HttpRequestTypes.GET,
              parseModel: NetworkMockModel());

      final foundModel = response.data as NetworkMockModel;
      expect(foundModel, isNotNull);
    });

   test(" -: fetch get list metod test", () async {
      final response =
          await networkService.fetch<List<NetworkMockModel>, NetworkMockModel>(
              ApplicationMockConstants.MOCK_TEST_GET_LIST_URL,
              type: HttpRequestTypes.GET,
              parseModel: NetworkMockModel());

    final foundModelList = response.data as List<NetworkMockModel>;
      expect(foundModelList, isNotNull);
      expect(foundModelList, isList);
    });
     

        test(' -: fetch post metod test', () async {
      final response = await networkService.fetch<NetworkMockModel,
              NetworkMockModel>(ApplicationMockConstants.MOCK_TEST_POST_URL,
          type: HttpRequestTypes.POST,
          parseModel: NetworkMockModel(),
          data: {"firstName": "firstName", "lastName": "lastName", "age": 30});

      final foundModel = response.data as NetworkMockModel;

      expect(foundModel, isNotNull);
    });

    test(' -: fetch metod error response model test', () async {
      try {
        final response = await networkService
            .fetch<NetworkMockModel, NetworkMockModel>(
                ApplicationMockConstants.MOCK_TEST_EXCEPTION_URL,
                type: HttpRequestTypes.GET,
                parseModel: NetworkMockModel(),
                data: {
              "firstName": "firstName",
              "lastName": "lastName",
              "age": 30
            });
      } on IBaseErrorModel catch (e) {
        expect(e, isNotNull);
        expect(e, isException);
      }
    });
  });



}
