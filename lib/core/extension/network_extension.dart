import '../constant/enum/network/http_request_types_enum.dart';

extension ExtensionOfNetworkTypes on HttpRequestTypesEnum {
  String get toMethod {
    switch (this) {
      case HttpRequestTypesEnum.GET:
        return 'GET';
      case HttpRequestTypesEnum.POST:
        return 'POST';
      case HttpRequestTypesEnum.PATCH:
        return 'PATCH';
      case HttpRequestTypesEnum.PUT:
        return 'PUT';
      case HttpRequestTypesEnum.DELETE:
        return 'DELETE';
      case HttpRequestTypesEnum.HEAD:
        return 'HEAD';
      case HttpRequestTypesEnum.OPTIONS:
        return 'OPTIONS';
      default:
        return '';
    }
  }
}
