import 'dart:io';
import 'package:flutter_notebook/core/constant/static/cache/cache_statics.dart';

import '../../../constant/enum/system/platform_types_enum.dart';
import 'package:path_provider/path_provider.dart';
import '../../../constant/enum/cache/caching_keys_enum.dart';
import '../../stuff/platform_selector/abstract/ife_platform_selector_service.dart';
import 'ife_cache_service.dart';

mixin ICacheManager implements ICacheService {
  final String cacheFolderName = CacheConstants.CACHE_FOLDER_NAME;
  final String cacheAuthenticationName =
      CacheConstants.CACHE_AUTHENTICATION_NAME;
  final String cacheSettingsName = CacheConstants.CACHE_SETTINGS;
  final String cacheSettingsSelectedLanguageType = "selected_language";
  final String cacheSettingsSelectedThemeType = "selected_theme";
  String? _currentEmail;

  setCurrentEmail(String? email) {
    _currentEmail = null;
    _currentEmail = email;
  }

  get currentEmail => _currentEmail;

  String? getCachingPath(IPlatformSelectorService platformSelectorService) {
    if (platformSelectorService.getCurrentPlatform() !=
        PlatformTypesEnum.WEB) {}
    return null;
  }

  Future<String> getCacheFolderPath() async {
    Directory document = await getApplicationDocumentsDirectory();
    String currentPath = document.path + "/" + cacheFolderName;
    bool isExist = await Directory(currentPath).exists();

    if (isExist) {
      return currentPath;
    } else {
      Directory createdPath =
          await Directory(document.path + "/" + cacheFolderName).create();
      return createdPath.path;
    }
  }

  // util metods ...
  String generateTokenKey(String? email, CachingKeysEnum key) {
    var tokenSearchItem =
        email != null ? "t-" + key.name + "--" + email : "f-" + key.name;
    return tokenSearchItem;
  }

  String? getEmailFromTokenSearchItem(
      String tokenSearchItem, CachingKeysEnum key) {
    return tokenSearchItem.substring(0, 1) == "f"
        ? null
        : tokenSearchItem.substring(key.name.length + 3);
  }
}
