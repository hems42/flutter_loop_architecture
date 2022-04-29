// ignore_for_file: unused_local_variable
import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_manager.dart';
import 'package:flutter_notebook/core/init/cache/concrete/hive/cache_manager_hive.dart';
import 'package:flutter_test/flutter_test.dart';

import '../cache_mock/cache_test_constant.dart';

void main() {
  final ICacheManager cacheManager =
      CacheManagerOfHive.instance as ICacheManager;

  group('cache manager hive authentication test group', () {
 test(' -: cache manager hive save access token test', () async {
    bool result = await cacheManager.saveAccesToken(CacheTestConstant.cachedAccessToken,
        email: CacheTestConstant.cacheEmail);

    expect(result, true);
    //expect("actual", _cachedAccessToken);
  });

  test(' -: cache manager hive get access token test', () async {
    String resultAccessToken =
        await cacheManager.getAccesToken(email: CacheTestConstant.cacheEmail);

    expect(resultAccessToken, CacheTestConstant.cachedAccessToken);
  });

  test(' -: cache manager hive update access token test', () async {
    bool resultUpdated = await cacheManager
        .updateAccesToken(CacheTestConstant.updatedAccessToken, email: CacheTestConstant.cacheEmail);
    String updatedAccessToken =
        await cacheManager.getAccesToken(email: CacheTestConstant.cacheEmail);

    expect(resultUpdated, true);
    expect(updatedAccessToken, CacheTestConstant.updatedAccessToken);
  });

  test(' -: cache manager hive save refresh token test', () async {
    bool result = await cacheManager.saveRefreshToken(CacheTestConstant.cachedRefreshToken,
        email: CacheTestConstant.cacheEmail);

    expect(result, true);
  });

  test(' -: cache manager hive get refresh token test', () async {
    String refreshToken =
        await cacheManager.getRefreshToken(email: CacheTestConstant.cacheEmail);

    expect(refreshToken, CacheTestConstant.cachedRefreshToken);
  });

  test(' -: cache manager hive update refresh token test', () async {
    bool result = await cacheManager.updateRefreshToken(CacheTestConstant.updatedRefreshToken,
        email: CacheTestConstant.cacheEmail);

    String updatedRefreshToken =
        await cacheManager.getRefreshToken(email: CacheTestConstant.cacheEmail);

    expect(result, true);
    expect(updatedRefreshToken, CacheTestConstant.updatedRefreshToken);
  });

    test(' -: cache manager hive without email save access token test', () async {
    bool result = await cacheManager.saveAccesToken(CacheTestConstant.cachedAccessToken);

    expect(result, true);
    //expect("actual", _cachedAccessToken);
  });

  test(' -: cache manager hive without email get access token test', () async {
    String resultAccessToken =
        await cacheManager.getAccesToken();

    expect(resultAccessToken, CacheTestConstant.cachedAccessToken);
  });

  test(' -: cache manager hive without email update access token test', () async {
    bool resultUpdated = await cacheManager
        .updateAccesToken(CacheTestConstant.updatedAccessToken);
    String updatedAccessToken =
        await cacheManager.getAccesToken();

    expect(resultUpdated, true);
    expect(updatedAccessToken, CacheTestConstant.updatedAccessToken);
  });

  test(' -: cache manager hive without email save refresh token test', () async {
    bool result = await cacheManager.saveRefreshToken(CacheTestConstant.cachedRefreshToken);

    expect(result, true);
  });

  test(' -: cache manager hive without email get refresh token test', () async {
    String refreshToken =
        await cacheManager.getRefreshToken();

    expect(refreshToken, CacheTestConstant.cachedRefreshToken);
  });

  test(' -: cache manager hive without email update refresh token test', () async {
    bool result = await cacheManager.updateRefreshToken(CacheTestConstant.updatedRefreshToken);

    String updatedRefreshToken =
        await cacheManager.getRefreshToken();

    expect(result, true);
    expect(updatedRefreshToken, CacheTestConstant.updatedRefreshToken);
  });

  });

 
}
