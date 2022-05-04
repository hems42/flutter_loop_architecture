import 'dart:io';

import 'package:flutter_notebook/core/extension/cache_extension.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constant/enum/cache/caching_keys_enum.dart';
import '../../../constant/static/app/application_statics.dart';
import 'ife_cache_service.dart';

mixin ICacheManager implements ICacheService {
  final String cacheFoldername = ApplicationConstants.CACHE_FOLDER_NAME;
  final String cacheAuthenticationName =
      ApplicationConstants.CACHE_AUTHENTICATION_NAME;

  // util document path

  Future<String> getCacheFolderPath() async {
    Directory document = await getApplicationDocumentsDirectory();
    String currentPath = document.path + "/" + cacheFoldername;
    bool isExist = await Directory(currentPath).exists();

    if (isExist) {
      return currentPath;
    } else { 
      Directory createdPath =
          await Directory(document.path + "/" + cacheFoldername).create();
      return createdPath.path;
    }

  }

  // util metods ...
  String getTokenSearchItem(String? email, CachingKeys key) {
    var tokenSearchItem = email != null ? key.toRaw + "--" + email : key.toRaw;
    return tokenSearchItem;
  }
}
