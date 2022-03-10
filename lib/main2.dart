import 'package:dio/dio.dart';

import 'core/constants/app/app_constant.dart';

Future<void> main(List<String> args) async {
  var options = BaseOptions(
    baseUrl: ApplicationConstants.API_BASE_URL.toString(),
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  var dio = Dio(options);

  await dio
      .post(
          "https://notebook-b-api.herokuapp.com/api/authentication/login",data: <String,dynamic>{"userNickname":"a",
    "email":null,
    "password":"a"})
      .then((value) {
    print(value.headers.toString() + " : headers");
    print(value.statusCode.toString() + " status code");
    print("gelen data : " + value.data.toString());
  }).onError((error, stackTrace) {
    print("gelen hata : " + error.toString());
  });
}
