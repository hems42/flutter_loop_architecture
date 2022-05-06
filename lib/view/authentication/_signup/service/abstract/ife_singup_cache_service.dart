import '../../../util/authentication_cache_service_util.dart';

abstract class ISignupCacheService extends AuthenticationCacheServiceUtil {
  Future<bool> saveAccesToken(String AccesToken,{String? email});
  Future<bool> updateAccesToken(String AccesToken,{String? email});
  Future<String> getAccesToken({String? email});
  Future<bool> saveRefreshToken(String refreshToken,{String? email});
  Future<bool> updateRefreshToken(String refreshToken,{String? email});
  Future<String> getRefreshToken({String? email});
}
