import '../abstract/ife_singup_cache_service.dart';

class SingupCacheService extends ISignupCacheService {
  @override
  Future<String> getAccesToken({String? email}) { 
    return cacheService.getAccesToken(email: email);
  }

  @override
  Future<String> getRefreshToken({String? email}) {
    return cacheService.getRefreshToken(email: email);
  }

  @override
  Future<bool> saveAccesToken(String AccesToken, {String? email}) {
    return cacheService.saveAccesToken(AccesToken, email: email);
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) {
    return cacheService.saveRefreshToken(refreshToken, email: email);
  }

  @override
  Future<bool> updateAccesToken(String AccesToken, {String? email}) {
    return cacheService.updateAccesToken(AccesToken, email: email);
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) {
    return cacheService.updateRefreshToken(refreshToken, email: email);
  }
}
