import 'package:flutter/material.dart';
import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';
import 'package:flutter_notebook/core/init/log/concrete/log_service.dart';
import '../../../constant/static/network/network_statics.dart';
import '../../../util/workbench/core_manager_workbench.dart';
import '../../../base/model/abstract/ife_base_network_model.dart';
import '../../../constant/static/app/application_statics.dart';
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
  var cacheService = CoreManagerWorkBench.instance.cacheService as CacheService;
  var logService = CoreManagerWorkBench.instance.logService as LogService;

  // rule - connection properties...
  final double _connectionTimeOut = 30.0;
  final double _receivingTimeOut = 5.0;

  // base url - paths
  final String _baseUrl = ApplicationConstants.API_BASE_URL;

  // local directory paths
  final String _baseLocalDirectory = "";

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
