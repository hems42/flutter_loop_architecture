import 'package:flutter/material.dart';
import '../../../constant/static/network/network_statics.dart';
import '../../../util/workbench/core_service_workbench.dart';
import '../../../base/model/abstract/ife_base_network_model.dart';
import 'ife_network_service.dart';

mixin INetworkManager implements INetworService {
  // ignore: todo
  // TODO List :
  // - internet connection checking management
  // - request encode
  // - response decode
  // - upload file
  // - download file
  // - cancel scenerio
  // - onConncetionlost sceniro
  // - onReConnceted sceniro
  //
  //
  //

  // util serviceses...
  var cacheService = CoreServiceWorkBench.cacheService;
  var logService = CoreServiceWorkBench.logService;
  
  // rule - connection properties...
  final int _connectionTimeOut = 300 ;
  final int _receivingTimeOut = 5;

  // base url - paths
  final String _baseUrl = NetworkConstants.API_BASE_MOCK_URL;

  // local directory paths
  final String _baseLocalDirectory = "";

  // acces token refesh retry time number
  int updateAccessTokenRefreshRetryTime = 3;

  get baseUrl => _baseUrl;

  get refreshTokenUrl => NetworkConstants.REFRESH_TOKEN_URL;

  get connectionTimeOut => _connectionTimeOut;

  get receivingTimeOut => _receivingTimeOut;

  get baseLocalDirectory => _baseLocalDirectory;

  // needable interrup metods...
  VoidCallback? onRequestV;
  Function? onRequestF;
  VoidCallback? onResponseV;
  Function? onResponseF;
  VoidCallback? onErrorV;
  Function? onErrorF;
  VoidCallback? onConnectionLostV;
  Function? onConnectionLostF;
  VoidCallback? onReConnectedV;
  Function? onReConnectedF;
  // util methods...
  R? responseParser<R, T>(IBaseNetworkModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }

  bool hasInternetnetConnection() {
    return true;
  }
}
