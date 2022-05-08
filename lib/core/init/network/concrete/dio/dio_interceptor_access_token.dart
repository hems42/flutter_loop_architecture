import 'package:dio/dio.dart';
import '../../../../util/mixin/core_mixin_cache_service.dart';

class DioAccessTokenInterceptor extends Interceptor with CoreMixinCacheService{
 
  

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
 
      
    
 

   //  var foundFlag = error.response!.headers.value("errorflag");
            
    //  if (foundFlag == "true") {
      //  var model = responseParser<ErrorResponseModel, ErrorResponseModel>(
      //      ErrorResponseModel(), error.response!.data);
     //   model!.statusCode = error.response!.statusCode.toString();
     //   error.type = DioErrorType.other;

      //  error.error = model;
     // }

      //  return handler.next(error);
      // print("gelen hata error : " + error.response!.data);

/*
      throw ErrorResponseModel(
        statusCode: error.response!.statusCode.toString(),
        errorCode: model!.errorCode,
        errorDescription: model.errorDescription,
        errorMessage: model.errorMessage,
        timestamp: model.timestamp
      );
      */

     // handler.next(error);

  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    
                      
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

     
    super.onResponse(response, handler);
  }
}