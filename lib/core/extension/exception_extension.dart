import '../base/model/abstract/ife_base_exception_model.dart';
import '../base/model/concrete/error_response_model.dart';

extension ExtensionOfIBaseExceptionModel on IBaseExceptionModel {
  String get errorBase => this.errorCode.toString().substring(0,4);
  String get errorTopic => this.errorCode.toString().substring(4,7);
  String get errorDetail => this.errorCode.toString().substring(7);
}

extension ExtensionOfErrorResponseModel on ErrorResponseModel {
  String get errorBase => this.errorCode.toString().substring(0,4);
  String get errorTopic => this.errorCode.toString().substring(4,7);
  String get errorDetail => this.errorCode.toString().substring(7);
}