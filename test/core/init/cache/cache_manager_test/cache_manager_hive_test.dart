// ignore_for_file: unused_local_variable
import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_manager.dart';
import 'package:flutter_notebook/core/init/cache/concrete/hive/cache_manager_hive.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ICacheManager cacheManager =
      CacheManagerOfHive.instance as ICacheManager;

  String _cachedAccessToken = "CACHED ACCESS TOKEN";
  String _updatedAccessToken = "UPDATED ACCESS TOKEN";
  String _cachedRefreshToken = "CACHED REFRESH TOKEN";
  String _updatedRefreshToken = "UPDATED REFRESH TOKEN";
  String _cacheEmail = "email@email";

  group('cache manager hive authentication test group', () {
 test(' -: cache manager hive save access token test', () async {
    bool result = await cacheManager.saveAccesToken(_cachedAccessToken,
        email: _cacheEmail);

    expect(result, true);
    //expect("actual", _cachedAccessToken);
  });

  test(' -: cache manager hive get access token test', () async {
    String resultAccessToken =
        await cacheManager.getAccesToken(email: _cacheEmail);

    expect(resultAccessToken, _cachedAccessToken);
  });

  test(' -: cache manager hive update access token test', () async {
    bool resultUpdated = await cacheManager
        .updateAccesToken(_updatedAccessToken, email: _cacheEmail);
    String updatedAccessToken =
        await cacheManager.getAccesToken(email: _cacheEmail);

    expect(resultUpdated, true);
    expect(updatedAccessToken, _updatedAccessToken);
  });

  test(' -: cache manager hive save refresh token test', () async {
    bool result = await cacheManager.saveRefreshToken(_cachedRefreshToken,
        email: _cacheEmail);

    expect(result, true);
  });

  test(' -: cache manager hive get refresh token test', () async {
    String refreshToken =
        await cacheManager.getRefreshToken(email: _cacheEmail);

    expect(refreshToken, _cachedRefreshToken);
  });

  test(' -: cache manager hive update refresh token test', () async {
    bool result = await cacheManager.updateRefreshToken(_updatedRefreshToken,
        email: _cacheEmail);

    String updatedRefreshToken =
        await cacheManager.getRefreshToken(email: _cacheEmail);

    expect(result, true);
    expect(updatedRefreshToken, _updatedRefreshToken);
  });

    test(' -: cache manager hive without email save access token test', () async {
    bool result = await cacheManager.saveAccesToken(_cachedAccessToken);

    expect(result, true);
    //expect("actual", _cachedAccessToken);
  });

  test(' -: cache manager hive without email get access token test', () async {
    String resultAccessToken =
        await cacheManager.getAccesToken();

    expect(resultAccessToken, _cachedAccessToken);
  });

  test(' -: cache manager hive without email update access token test', () async {
    bool resultUpdated = await cacheManager
        .updateAccesToken(_updatedAccessToken);
    String updatedAccessToken =
        await cacheManager.getAccesToken();

    expect(resultUpdated, true);
    expect(updatedAccessToken, _updatedAccessToken);
  });

  test(' -: cache manager hive without email save refresh token test', () async {
    bool result = await cacheManager.saveRefreshToken(_cachedRefreshToken);

    expect(result, true);
  });

  test(' -: cache manager hive without email get refresh token test', () async {
    String refreshToken =
        await cacheManager.getRefreshToken();

    expect(refreshToken, _cachedRefreshToken);
  });

  test(' -: cache manager hive without email update refresh token test', () async {
    bool result = await cacheManager.updateRefreshToken(_updatedRefreshToken);

    String updatedRefreshToken =
        await cacheManager.getRefreshToken();

    expect(result, true);
    expect(updatedRefreshToken, _updatedRefreshToken);
  });

  });

 



}
