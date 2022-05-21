import 'package:dio/dio.dart';
import '../../../cache/abstract/ife_cache_service.dart';

class DioAccessTokenInterceptor extends QueuedInterceptor {
  late ICacheService cacheService;
  DioAccessTokenInterceptor(ICacheService cacheService) {
    this.cacheService = cacheService;
  }

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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
class Api {
  final Dio api = Dio();
  String? accessToken;

  final _storage;

  Api(this._storage) {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('http')) {
        options.path = 'http://192.168.0.20:8080' + options.path;
      }
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if ((error.response?.statusCode == 401 &&
          error.response?.data['message'] == "Invalid JWT")) {
        if (await _storage.containsKey(key: 'refreshToken')) {
          if (await refreshToken()) {
            return handler.resolve(await _retry(error.requestOptions));
          }
        }
      }
      return handler.next(error);
    }));
  }
 
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await api
        .post('/auth/refresh', data: {'refreshToken': refreshToken});
 
    if (response.statusCode == 201) {
      accessToken = response.data;
      return true;
    } else {
      // refresh token is wrong
      accessToken = null;
      _storage.deleteAll();
      return false;
    }
  }
} 