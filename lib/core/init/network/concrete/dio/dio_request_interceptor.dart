import 'package:dio/dio.dart';

class DioInterceptorCustpm extends Interceptor{
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
                        
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}