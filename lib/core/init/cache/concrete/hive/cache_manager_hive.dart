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
        generateTokenKey(email, CachingKeysEnum.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    String accessToken = await authenticationBox.get(accessTokenSearchItem);
    authenticationBox.close();
    return accessToken;
  }

  @override
  Future<String> getRefreshToken({String? email}) async {
    var refreshTokenSearchItem =
        generateTokenKey(email, CachingKeysEnum.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    String refreshToken = await authenticationBox.get(refreshTokenSearchItem);
    await authenticationBox.close();
    return refreshToken;
  }

  @override
  Future<bool> saveAccesToken(String accesToken, {String? email}) async {
    setCurrentEmail(email);
    var accessTokenSearchItem =
        generateTokenKey(email, CachingKeysEnum.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(accessTokenSearchItem, accesToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) async {
    var refreshTokenSearchItem =
        generateTokenKey(email, CachingKeysEnum.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(refreshTokenSearchItem, refreshToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> updateAccesToken(String accesToken, {String? email}) async {
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(
        generateTokenKey(email, CachingKeysEnum.ACCESS_TOKEN), accesToken);
    await authenticationBox.close();
    return true;
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) async {
    var refreshTokenSearchItem =
        generateTokenKey(email, CachingKeysEnum.REFRESH_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    await authenticationBox.put(refreshTokenSearchItem, refreshToken);
    await authenticationBox.close();
    return true;
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
  Future<String?> getAccessTokenEmail(
      {Function(String? email)? checkEmail}) async {
    var c = generateTokenKey(currentEmail, CachingKeysEnum.ACCESS_TOKEN);
    var authenticationBox = await Hive.openBox(cacheAuthenticationName);
    String? token = authenticationBox.get(c);
    authenticationBox.close();
    checkEmail?.call(currentEmail);
    return token;
  }

  // util metods

  Future<void> initHive() async {
    String cacheFoldePath = await getCacheFolderPath();
    Hive.init(cacheFoldePath);
    isInitialized = true;
  }
}
