import '../../../constant/enum/theme/theme_types_enum.dart';

abstract class ICacheService {
  ThemeTypesEnum getCurrentThme();
  Future<bool> ensureInit();
  Future<bool> deleteAccesToken(String AccesToken, {String? email});
  Future<bool> saveAccesToken(String AccesToken, {String? email});
  Future<bool> updateAccesToken(String AccesToken, {String? email});
  Future<String> getAccesToken({String? email});
  Future<bool> deleteRefreshToken(String refreshToken, {String? email});
  Future<bool> saveRefreshToken(String refreshToken, {String? email});
  Future<bool> updateRefreshToken(String refreshToken, {String? email});
  Future<String> getRefreshToken({String? email});
  // acces token save

  // refresh token

  // settings

  // init settings

  // save models

  // save personel inf

  // hash-encode data

}
