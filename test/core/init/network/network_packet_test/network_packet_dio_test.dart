// ignore_for_file: unused_local_variable
import 'package:dio/dio.dart';
import 'package:flutter_notebook/core/base/model/concrete/error_response_model.dart';
import 'package:flutter_notebook/core/constant/static/app/application_statics.dart';
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

      print('modelden gelen hata'+model.toString());
      model;
      //  var error = ErrorResponseModel. e.response.data
      return handler.next(e);
    }));

    final response =
        await dio.post(base_url + '/authentication/deneme?deneme=A');

    response.data;

    //expect(, await dio.get(base_url));
  });
}
