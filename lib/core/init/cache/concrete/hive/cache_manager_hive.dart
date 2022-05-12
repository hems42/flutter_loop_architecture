// ignore_for_file: unnecessary_null_comparison

import '../../../../constant/enum/cache/caching_keys_enum.dart';
import '../../../../constant/enum/theme/theme_types_enum.dart';
import '../../abstract/ife_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheManagerOfHive with ICacheManager {
  static CacheManagerOfHive? _instance;
  bool isInitialized = false;
  var authenticationBox;
  static CacheManagerOfHive? get instance {
    _instance ??= CacheManagerOfHive._init();
    return _instance;
  }

  CacheManagerOfHive._init() {
    initHive();
  }

  @override
  Future<bool> ensureInit() {
    if (!isInitialized) {
      initHive();
    }
    return Future.value(true);
  }

  @override
  ThemeTypesEnum getCurrentThme() {
    throw UnimplementedError();
  }

  @override
  Future<String> getAccesToken({String? email}) async {
    var accessTokenSearchItem =
        getTokenSearchItem(email, CachingKeysEnum.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    String accessToken = await authenticationBox.get(accessTokenSearchItem);
    authenticationBox.close();
    return accessToken;
  }

  @override
  Future<String> getRefreshToken({String? email}) async {
    var refreshTokenSearchItem =
        getTokenSearchItem(email, CachingKeysEnum.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    String refreshToken = await authenticationBox.get(refreshTokenSearchItem);
    await authenticationBox.close();
    return refreshToken;
  }

  @override
  Future<bool> saveAccesToken(String accesToken, {String? email}) async {
    var accessTokenSearchItem =
        getTokenSearchItem(email, CachingKeysEnum.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(accessTokenSearchItem, accesToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) async {
    var refreshTokenSearchItem =
        getTokenSearchItem(email, CachingKeysEnum.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(refreshTokenSearchItem, refreshToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> updateAccesToken(String accesToken, {String? email}) async {
    var accessTokenSearchItem =
        getTokenSearchItem(email, CachingKeysEnum.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(accessTokenSearchItem, accesToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) async {
    var refreshTokenSearchItem =
        getTokenSearchItem(email, CachingKeysEnum.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(refreshTokenSearchItem, refreshToken);
    await authenticationBox.close();
    return true;
  }

  // util metods

  Future<void> initHive() async {
    String cacheFoldePath = await getCacheFolderPath();
    Hive.init(cacheFoldePath);
    isInitialized = true;
  }

  @override
  Future<bool> deleteAccesToken(String AccesToken, {String? email}) {
    return Future(() => true);
  }

  @override
  Future<bool> deleteRefreshToken(String refreshToken, {String? email}) async {
    return Future(() => true);
  }

  @override
  Future<String> getAccessTokenEmail(
      {Function(String? email)? checkEmail}) async {
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    var searchItem = getSearchItemFromKeys(authenticationBox);
    var token = await authenticationBox.get(searchItem);
    authenticationBox.close();
    checkEmail?.call(getEmailFromTokenSearchItem(searchItem!, CachingKeysEnum.ACCESS_TOKEN));
    return token;
  }

  String? getSearchItemFromKeys(Box<dynamic> box) {
    String? searchItemKey = null;
    box.keys.forEach((element) {
      if (element.toString().substring(0, 1) == "t") {
        searchItemKey = element.toString();
      } else if (element.toString().substring(0, 1) == "f") {
        searchItemKey = element.toString();
      } else {
        searchItemKey = null;
      }
    });
    return searchItemKey;
  }
}
