import '../../../util/authentication_cache_service_util.dart';

abstract class ISignupCacheService extends AuthenticationCacheServiceUtil {
   Future<String?> getAccessToken({checkEmail (String? email)?});
  Future<bool> deleteAccesToken({String? email, checkEmail (String? email)?});
  Future<bool> saveAccesToken(String accesToken, {String? email});
  Future<bool> updateAccesToken(String accesToken, {String? email});
  // refresh token
  Future<String?> getRefreshToken({checkEmail (String? email)?});
  Future<bool> deleteRefreshToken({String? email, checkEmail (String? email)?});
  Future<bool> saveRefreshToken(String refreshToken, {String? email});
  Future<bool> updateRefreshToken(String refreshToken, {String? email});
}
