import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_notebook/view/json_place_holder/model/comment_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  CommentModel? comment;
  setUp((() {
    dio =
        Dio(BaseOptions(connectTimeout: 300, responseType: ResponseType.json));
  }));

  test("get data", () async {
    final response =
        await dio.get("https://jsonplaceholder.typicode.com/comments/1");
    comment = CommentModel.fromJson(response.data);
    expect(comment, isNotNull);
  });

  test("get users", (() async {
    final response =
        await dio.get("http://localhost:8080/api/users/getAllUsers");
    expect(response.data, isNotNull);
    expect(response.data, isList);
  }));

  test('get exception test', () async {

    final response = await dio
        .post('http://localhost:8080/api/authentication/signup', data: {
      "userNickName": "ali",
      "eMail": "ali@ali",
      "password": "ali"
    }).catchError((e) {
      print(""+(e as DioError).response!.data.toString());
    });

    print('gelen response : ' + response.data);
  });
}
