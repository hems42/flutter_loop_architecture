import 'package:dio/dio.dart';
import 'package:flutter_notebook/view/json_place_holder/model/todo_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  TodoModel? todos;
  setUp((() {
    dio = Dio();
  }));

  test("get data", () {
    final response = dio.get("https://jsonplaceholder.typicode.com/todos/1");

    response.then((value) {
      todos = TodoModel.fromJson(value.data);
    }).catchError((e) {
      print("gelen hata : " + e.toString());
    }).whenComplete(() => print("completed"));

    expect(todos, isNotNull);
  });
}
