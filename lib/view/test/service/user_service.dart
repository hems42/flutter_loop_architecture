import 'package:dio/dio.dart';
import 'package:flutter_notebook/view/test/entity/kul.dart';
import 'package:flutter_notebook/view/test/entity/user.dart';
import 'package:flutter_notebook/view/test/service/repository.dart';



class UserService {
  Future<List<User>> getAllUsers() async {
    List<User> users;

    print("işlem başladı");
    var repository = Repository.instance;
    var response;
    // Dio dio = Dio();
    // dio.options.headers['content-Type'] = 'text/plain; charset=UTF-8';
    //   dio.options.headers['Access-Control-Allow-Origin'] = '*';
    //  dio.options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
    // print("base url için girilen  : " + dio.options.baseUrl);

    try {
      response =
          await Dio().get('http://192.168.42.179:8080/api/users/getAllUsers');
      //print(response);
      // print(response.headers);
      // print(response.requestOptions);
      // print(response.statusCode);

    } on DioError catch (e) {
      //All exceptions
      print('All exceptions  ' + e.response.toString());
    } catch (e) {
      //Do not specify error type, match all
      print('match all ');
    }

    // var uri = Uri.http("192.168.1.152:8080", "/api/v1/cities/getAllCities");
    print("çevirmke üzere");
    users = (response.data as List).map((x) => User.fromJson(x)).toList();

    print(users);
    return users;
  }

  Future<List<kul>?> getAllKuls() async {
    print("işlem başladı");
    var repository = Repository.instance;
    Dio dio = repository.dio;
    print("base url için girilen  : " + dio.options.baseUrl);

    try {
      Response response = await dio.get('todos');
      // print(response.data);
      print(response.headers);
      print(response.requestOptions);
      print(response.statusCode);
    } on DioError catch (e) {
      //All exceptions
      print('All exceptions  ' + e.toString());
    } catch (e) {
      //Do not specify error type, match all
      print('match all ');
    }

    // var uri = Uri.http("192.168.1.152:8080", "/api/v1/cities/getAllCities");

    return null;
  }
}
