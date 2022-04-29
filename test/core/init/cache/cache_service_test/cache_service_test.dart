import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_service.dart';
import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../cache_mock/cache_test_constant.dart';

void main() {
    ICacheService cacheService = CacheService.instance;
    
 group('cache service authentication test group', () {
 test(' -: cache service save access token test', () async {
    bool result = await cacheService.saveAccesToken(CacheTestConstant.cachedAccessToken,
        email: CacheTestConstant.cacheEmail);

    expect(result, true);
  });

  test(' -: cache service get access token test', () async {
    String resultAccessToken =
        await cacheService.getAccesToken(email: CacheTestConstant.cacheEmail);

    expect(resultAccessToken, CacheTestConstant.cachedAccessToken);
  });

  test(' -: cache service update access token test', () async {
    bool resultUpdated = await cacheService
        .updateAccesToken(CacheTestConstant.updatedAccessToken, email: CacheTestConstant.cacheEmail);
    String updatedAccessToken =
        await cacheService.getAccesToken(email: CacheTestConstant.cacheEmail);

    expect(resultUpdated, true);
    expect(updatedAccessToken, CacheTestConstant.updatedAccessToken);
  });

  test(' -: cache service save refresh token test', () async {
    bool result = await cacheService.saveRefreshToken(CacheTestConstant.cachedRefreshToken,
        email: CacheTestConstant.cacheEmail);

    expect(result, true);
  });

  test(' -: cache service get refresh token test', () async {
    String refreshToken =
        await cacheService.getRefreshToken(email: CacheTestConstant.cacheEmail);

    expect(refreshToken, CacheTestConstant.cachedRefreshToken);
  });

  test(' -: cache service  update refresh token test', () async {
    bool result = await cacheService.updateRefreshToken(CacheTestConstant.updatedRefreshToken,
        email: CacheTestConstant.cacheEmail);

    String updatedRefreshToken =
        await cacheService.getRefreshToken(email: CacheTestConstant.cacheEmail);

    expect(result, true);
    expect(updatedRefreshToken, CacheTestConstant.updatedRefreshToken);
  });

    test(' -: cache service without email save access token test', () async {
    bool result = await cacheService.saveAccesToken(CacheTestConstant.cachedAccessToken);

    expect(result, true);
    //expect("actual", _cachedAccessToken);
  });

  test(' -: cache service without email get access token test', () async {
    String resultAccessToken =
        await cacheService.getAccesToken();

    expect(resultAccessToken, CacheTestConstant.cachedAccessToken);
  });

  test(' -: cache service without email update access token test', () async {
    bool resultUpdated = await cacheService
        .updateAccesToken(CacheTestConstant.updatedAccessToken);
    String updatedAccessToken =
        await cacheService.getAccesToken();

    expect(resultUpdated, true);
    expect(updatedAccessToken, CacheTestConstant.updatedAccessToken);
  });

  test(' -: cache service without email save refresh token test', () async {
    bool result = await cacheService.saveRefreshToken(CacheTestConstant.cachedRefreshToken);

    expect(result, true);
  });

  test(' -: cache service without email get refresh token test', () async {
    String refreshToken =
        await cacheService.getRefreshToken();

    expect(refreshToken, CacheTestConstant.cachedRefreshToken);
  });

  test(' -: cache service without email update refresh token test', () async {
    bool result = await cacheService.updateRefreshToken(CacheTestConstant.updatedRefreshToken);

    String updatedRefreshToken =
        await cacheService.getRefreshToken();

    expect(result, true);
    expect(updatedRefreshToken, CacheTestConstant.updatedRefreshToken);
  });

  });

 
  
}
