import '../constant/enum/network/http_request_types_enum.dart';

extension ExtensionOfNetworkTypes on HttpRequestTypes {
  String get toMethod {
    switch (this) {
      case HttpRequestTypes.GET:
        return 'GET';
      case HttpRequestTypes.POST:
        return 'POST';
      case HttpRequestTypes.PATCH:
        return 'PATCH';
      case HttpRequestTypes.PUT:
        return 'PUT';
      case HttpRequestTypes.DELETE:
        return 'DELETE';
      case HttpRequestTypes.HEAD:
        return 'HEAD';
      case HttpRequestTypes.OPTIONS:
        return 'OPTIONS';
      default:
        return '';
    }
  }
}
