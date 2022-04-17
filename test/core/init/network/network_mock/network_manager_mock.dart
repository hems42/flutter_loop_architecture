import 'package:flutter_notebook/core/constants/app/app_constant.dart';
import 'package:flutter_notebook/core/constants/enum/network/http_request_types_enum.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_response_model.dart';
import 'package:flutter_notebook/core/base/model/abstract/ife_base_model.dart';
import 'package:flutter_notebook/core/init/network/abstract/ife_network_manager.dart';

import '../../../mock/ife_core_mock.dart';

class NetworkManagerMock extends ICoreMock with INetworkManager{
  
    // NETWORK SERVICE URL LIST
  static const API_BASE_URL = ApplicationConstants.API_BASE_URL;
  //-- authentication url:
  static const SIGN_UP_URL = API_BASE_URL + ApplicationConstants.SIGN_UP_URL;
  static const REGISTER_URL = API_BASE_URL + ApplicationConstants.REGISTER_URL;
  static const LOGIN_URL = API_BASE_URL + ApplicationConstants.LOGIN_URL;
  static const REFRESH_TOKEN_URL = API_BASE_URL + ApplicationConstants.REFRESH_TOKEN_URL;
  static const LOGOUT_URL = API_BASE_URL + ApplicationConstants.LOGOUT_URL;
  static const FORGET_PASSWORD_URL = ApplicationConstants.FORGET_PASSWORD_URL;
  static const RESEND_EMAIL_URL = API_BASE_URL + ApplicationConstants.RESEND_EMAIL_URL;

    // NETWORK SERVICE MOCK URL LIST
  static const MOCK_API_BASE_URL = "http://localhost:8080/api";
  //-- authentication mock url:
  static const MOCK_SIGN_UP_URL = API_BASE_URL + "/authentication/signup";
  static const MOCK_REGISTER_URL = API_BASE_URL + "/authentication/registration";
  static const MOCK_LOGIN_URL = API_BASE_URL + "/authentication/login";
  static const MOCK_REFRESH_TOKEN_URL = API_BASE_URL + "/authentication/refreshToken";
  static const MOCK_LOGOUT_URL = API_BASE_URL + "/authentication/logout";
  static const MOCK_FORGET_PASSWORD_URL = "/authentication/_?";
  static const MOCK_RESEND_EMAIL_URL = API_BASE_URL + "/authentication/_?";


  @override
  Future<IBaseResponseModel<R>> fetch<R, T extends IBaseModel>(String path, {required HttpRequestTypes type, required T parseModel, data, Map<String, Object>? queryParameters, void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> fetchNoNetwork<R, T extends IBaseModel>(String path, {required HttpRequestTypes type, required T parseModel, data, Map<String, Object>? queryParameters, void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement fetchNoNetwork
    throw UnimplementedError();
  }

  @override
  Future<IBaseResponseModel<R>> send<R, T extends IBaseModel>(String path, {required HttpRequestTypes type, required T parseModel, data, Map<String, Object>? queryParameters, void Function(int p1, int p2)? onReceiveProgress}) {
    // TODO: implement send
    throw UnimplementedError();
  }
}
