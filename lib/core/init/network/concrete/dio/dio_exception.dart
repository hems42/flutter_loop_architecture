import 'package:dio/dio.dart';

class DioException extends DioError{
  
  DioException({required RequestOptions requestOptions}) : super(requestOptions: requestOptions);
}