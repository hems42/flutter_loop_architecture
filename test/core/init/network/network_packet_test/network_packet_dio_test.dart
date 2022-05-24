/* // ignore_for_file: unused_local_variable
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_notebook/core/base/model/concrete/error_response_model.dart';
import 'package:flutter_notebook/core/constant/enum/network/http_request_types_enum.dart';
import 'package:flutter_notebook/core/constant/static/app/application_statics.dart';
import 'package:flutter_notebook/core/init/cache/concrete/hive/cache_manager_hive.dart';
import 'package:flutter_notebook/core/init/network/concrete/dio/network_manager_dio.dart';
import 'package:flutter_notebook/view/authentication/_signup/model/signup_request_model.dart';
import 'package:flutter_notebook/view/authentication/_signup/model/signup_response_model.dart';
import 'package:flutter_notebook/view/authentication/_signup/service/concrete/signup_cache_service.dart';
import 'package:flutter_notebook/view/authentication/_signup/service/concrete/signup_network_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;

  final base_url = ApplicationConstants.API_BASE_URL;
  setUp((() {
    dio = Dio(BaseOptions(baseUrl: base_url));
  }));

  test("get data", () async {});

  test('dio interceptor hamdling test', () async {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('Sending request to: ' + options.path);
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('Response status code: ' + response.statusCode.toString());
      print('Response data: ' + response.data.toString());

      //return handler.next(response);
    }, onError: (DioError e, handler) {
      print('Error received! Message is: ' + e.message);
      var response = e.response;
      var map = response!.data as Map;
      var model = ErrorResponseModel(
          errorCode: map.values.elementAt(2),
          errorDescription: map.values.elementAt(0),
          errorMessage: map.values.elementAt(1),
          statusCode: response.statusCode.toString(),
          timestamp: map.values.elementAt(3));

      print('modelden gelen hata' + model.toString());
      model;
      //  var error = ErrorResponseModel. e.response.data
      return handler.next(e);
    }));

    final response =
        await dio.post(base_url + '/authentication/deneme?deneme=A');

    response.data;

    //expect(, await dio.get(base_url));
  });

  test("refresh toen test", () async {
    Dio dio = Dio();
    String accesToken = "eski accessToken";
    dio.interceptors.add(QueuedInterceptorsWrapper(onError: (e, handler) async {
      e;
      handler;
      await dio
          .get(
              "https://69f648e2-5a86-4a7f-ab23-6b9121fab04f.mock.pstmn.io/test_refresh_token")
          .then((value) {
        print("yenilenen acces token  :" + value.toString());
        accesToken = jsonEncode(value.data);
      });

      print("kaldığı yerden ateşledik");

      return handler.resolve(await _retry(dio, e.requestOptions));
    }, onRequest: (e, handler) {
      e.headers.addAll({"Authorization": "Barear $accesToken"});
      print("requeste geldi : " + e.toString());
      return handler.next(e);
    }));

    var a = await dio.get(
        "https://69f648e2-5a86-4a7f-ab23-6b9121fab04f.mock.pstmn.io/unauthorize_metod");

    var b = await dio.get(
        "https://69f648e2-5a86-4a7f-ab23-6b9121fab04f.mock.pstmn.io/test_get_list_metod");

    print("en sonunda gelen oğlan : " + b.data);
  });

  test("fgfg", () async {
    var a = await CacheManagerOfHive.instance!.ensureInit();
    SingupCacheService cacheService = SingupCacheService();
    SignupNetworkService networkService = SignupNetworkService();
/* 
    var signupResponse = await networkService.signup(SignupRequestModel(
        eMail: "12mopi@mopi", userNickName: "12mopi", password: "mopi"));

    print("gelen response :" + signupResponse.toString());
    var accesTokenSaved = await cacheService.saveAccesToken(
        "signupResponse!.accessToken.toString()",
        email: "signupResponse.email");

    var refreshTokenSaved = await cacheService.saveRefreshToken(
        "signupResponse.refreshToken.toString()",
        email: "signupResponse.email"); */
    print("gelen token : " + await cacheService.getAccessToken().toString());
  });

  test("kjdfjfdkl", () async {
    //  var b = await CacheManagerOfHive.instance!.ensureInit();
    var a = await NetworkManagerOfDio.instance!
        .send<SignupResponseModel, SignupResponseModel>(
            ApplicationConstants.SIGN_UP_URL,
            type: HttpRequestTypesEnum.POST,
            parseModel: SignupResponseModel(),
            data: SignupRequestModel(
                    eMail: "7mopi@mopi",
                    userNickName: "7mopi",
                    password: "mopi")
                .toJson());

    print("gelen tokenlar : " +
        (a.data as SignupResponseModel).accessToken.toString());
  });
}

Future<Response<dynamic>> _retry(Dio dio, RequestOptions requestOptions) async {
  final options = new Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  return dio.request<dynamic>(requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options);
}
 */