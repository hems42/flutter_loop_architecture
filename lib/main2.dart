import 'package:dio/dio.dart';

import 'core/constants/app/app_constant.dart';

Future<void> main(List<String> args) async {
  var options = BaseOptions(
    baseUrl: ApplicationConstants.API_BASE_URL.toString(),
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  var dio = Dio(options);

  logout(dio, "fed7c25d-49fc-4326-b2bf-f3f9729f634b");
}

Future<void> login(
    Dio dio, String nickName, String email, String password) async {
  await dio.post(
      "https://notebook-b-api.herokuapp.com/api/authentication/login",
      data: <String, dynamic>{
        "userNickname": nickName,
        "email": email,
        "password": password
      }).then((value) {
    print(value.headers.toString() + " : headers");
    print(value.statusCode.toString() + " status code");
    print("gelen data : " + value.data.toString());
  }).onError((error, stackTrace) {
    print("gelen hata : " + error.toString());
  });
}

Future<void> logout(Dio dio, String reftoken) async {
  var response = await dio
      .post(
          "https://notebook-b-api.herokuapp.com/api/authentication/logout?refreshToken=$reftoken")
      .then((value) {
    print(value.headers.toString() + " : headers");
    print(value.statusCode.toString() + " status code");
    print("gelen data : " + value.data.toString());
  }).onError((error, stackTrace) {
    print("gelen hata : " + error.toString());
  }).catchError((e) {
    print("yakalanan hata : " + e.toString());
  });
}
