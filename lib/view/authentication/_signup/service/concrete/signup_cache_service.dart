import '../abstract/ife_singup_cache_service.dart';

class SingupCacheService extends ISignupCacheService {
   // access token
  @override
  Future<String?> getAccessToken({Function(String? email)? checkEmail}) {
    return cacheService.getAccessToken(checkEmail: checkEmail);
  }

  @override
  Future<bool> deleteAccesToken({String? email, checkEmail(String? email)?}) {
    return cacheService.deleteAccesToken(checkEmail: checkEmail, email: email);
  }

  @override
  Future<bool> saveAccesToken(String accesToken, {String? email}) {
    return cacheService.saveAccesToken(accesToken, email: email);
  }

  @override
  Future<bool> updateAccesToken(String accesToken, {String? email}) {
    return cacheService.updateAccesToken(accesToken, email: email);
  }

  // refresh token
  @override
  Future<String?> getRefreshToken({Function(String? email)? checkEmail}) {
    return cacheService.getRefreshToken(checkEmail: checkEmail);
  }

  @override
  Future<bool> deleteRefreshToken({String? email, checkEmail(String? email)?}) {
    return cacheService.deleteRefreshToken(checkEmail: checkEmail, email: email);
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) {
    return cacheService.saveRefreshToken(refreshToken, email: email);
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) {
    return cacheService.updateRefreshToken(refreshToken, email: email);
  }

}
