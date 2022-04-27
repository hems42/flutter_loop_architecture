import '../../../constants/enum/theme/app_theme_types_enum.dart';

abstract class ICacheService {
  AppThemeTypes getCurrentThme();
  Future<bool> ensureInit();
  Future<bool> saveAccesToken(String AccesToken);
  Future<String> updateAccesToken(String AccesToken);
  Future<String> getAccesToken();
  Future<String> saveRefreshToken(String refreshToken);
  Future<String> updateRefreshToken(String refreshToken);
  Future<String> getRefreshToken();
  // acces token save

  // refresh token

  // settings

  // init settings

  // save models

  // save personel inf

  // hash-encode data

}
