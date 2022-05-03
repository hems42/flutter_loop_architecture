import 'package:flutter/material.dart';
import '../../../base/model/abstract/ife_base_network_model.dart';
import '../../../constant/static/application_statics.dart';
import 'ife_network_service.dart';

mixin INetworkManager implements INetworService {
  // ignore: todo
  // TODO List :
  // - token resfresh mechanism
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
  // ignore: prefer_typing_uninitialized_variables
  var cacheService;
  // ignore: prefer_typing_uninitialized_variables
  var logService;

  // rule - connection properties...
  final double _connectionTimeOut = 50.0;
  final double _receivingTimeOut = 3.0;

  // base url - paths
  final String _baseUrl = ApplicationConstants.API_BASE_URL;

  // local directory paths
  final String _baseLocalDirectory = "";

  get baseUrl => _baseUrl;

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
