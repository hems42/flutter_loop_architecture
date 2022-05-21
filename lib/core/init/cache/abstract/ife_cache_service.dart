import '../../../constant/enum/theme/theme_types_enum.dart';

abstract class ICacheService {
  ThemeTypesEnum getCurrentThme();
  Future<bool> ensureInit();

  // access token
  Future<String?> getAccessToken({checkEmail (String? email)?});
  Future<bool> deleteAccesToken({String? email, checkEmail (String? email)?});
  Future<bool> saveAccesToken(String accesToken, {String? email});
  Future<bool> updateAccesToken(String accesToken, {String? email});
  // refresh token
  Future<String?> getRefreshToken({checkEmail (String? email)?});
  Future<bool> deleteRefreshToken({String? email, checkEmail (String? email)?});
  Future<bool> saveRefreshToken(String refreshToken, {String? email});
  Future<bool> updateRefreshToken(String refreshToken, {String? email});
  
  
  // acces token save

  // refresh token

  // settings

  // init settings

  // save models

  // save personel inf

  // hash-encode data

}
