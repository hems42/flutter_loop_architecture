import '../../../constants/app/app_constant.dart';
import '../../../base/model/abstract/ife_base_model.dart';
import '../../../base/model/abstract/ife_base_response_model.dart';
import '../../../constants/enum/http_request_types_enum.dart';
import 'ife_network_service.dart';

mixin INetworkManager implements INetworService {
  // ignore: prefer_typing_uninitialized_variables
  var cacheService;
  // ignore: prefer_typing_uninitialized_variables
  var logService;

  // rule - connection properties...
  final double _connectionTimeOut = 50.0;
  final double _receivingTimeOut = 3.0;

  // base url - paths
  final String _baseUrl = ApplicationConstants.API_BASE_URL;
  final String _user = "/users";
  final String _authentication = "/authentication";

  get connectionTimeOut => _connectionTimeOut;

  get receivingTimeOut => _receivingTimeOut;

  get user => _baseUrl + _user;

  get authentication => _baseUrl + _authentication;

  R? responseParser<R, T>(IBaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, Object>) as R;
    }
    return data as R?;
  }

  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

  Future<IBaseResponseModel<R>> send<R, T extends IBaseModel>(String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});

  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(
      String path,
      {required HttpRequestTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
