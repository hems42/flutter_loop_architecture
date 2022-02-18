import 'package:dio/dio.dart';

class Repository {
  static final Repository _instance = Repository._init();
  static Repository get instance {
    return _instance;
  }

  Repository._init() {

        final baseOptions = BaseOptions(baseUrl: 'http://192.168.1.153:8080/api/');
    // _dio = Dio(baseOptions);

    
    _dio = Dio(); // with default Options

  

// Set default configs
 
   
  }

  late Dio _dio;

  Dio get dio => _dio;
}
