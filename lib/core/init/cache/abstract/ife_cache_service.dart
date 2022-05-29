import 'package:flutter_notebook/core/constant/enum/cache/caching_keys_enum.dart';

import '../../../constant/enum/theme/theme_types_enum.dart';

abstract class ICacheService {
  ThemeTypesEnum getCurrentTheme();
  Future<bool> ensureInit();

  // access token
  Future<String?> getAccessToken({checkEmail(String? email)?});
  Future<bool> deleteAccesToken({String? email, checkEmail(String? email)?});
  Future<bool> saveAccesToken(String accesToken, {String? email});
  Future<bool> updateAccesToken(String accesToken, {String? email});
  // refresh token
  Future<String?> getRefreshToken({checkEmail(String? email)?});
  Future<bool> deleteRefreshToken({String? email, checkEmail(String? email)?});
  Future<bool> saveRefreshToken(String refreshToken, {String? email});
  Future<bool> updateRefreshToken(String refreshToken, {String? email});

  // general value
  Future<dynamic> getValue(CachingKeysEnum cachingKey,
   {String? cacheTopic, dynamic cacheUtil});
  Future<dynamic> deleteValue(CachingKeysEnum cachingKey,
   {String? cacheTopic, dynamic cacheUtil});
  Future<dynamic> saveValue(CachingKeysEnum cachingKey, dynamic valueForSave,
   {String? cacheTopic, dynamic cacheUtil});
  Future<dynamic> updateValue(CachingKeysEnum cachingKey, dynamic valueForSave,
   {String? cacheTopic, dynamic cacheUtil});

}
