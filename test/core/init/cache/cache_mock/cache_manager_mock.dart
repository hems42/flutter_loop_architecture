import 'package:flutter_notebook/core/constant/enum/theme/theme_types_enum.dart';
import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_manager.dart';

import '../../../mock/ife_core_mock.dart';

class CacheManagerMock extends ICoreMock with ICacheManager {
  @override
  Future<bool> ensureInit() {
    // TODO: implement ensureInit
    throw UnimplementedError();
  }

  @override
  Future<String> getAccesToken({String? email}) {
    // TODO: implement getAccesToken
    throw UnimplementedError();
  }

  @override
  ThemeTypesEnum getCurrentThme() {
    // TODO: implement getCurrentThme
    throw UnimplementedError();
  }

  @override
  Future<String> getRefreshToken({String? email}) {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAccesToken(String AccesToken, {String? email}) {
    // TODO: implement saveAccesToken
    throw UnimplementedError();
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken, {String? email}) {
    // TODO: implement saveRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> updateAccesToken(String AccesToken, {String? email}) {
    // TODO: implement updateAccesToken
    throw UnimplementedError();
  }

  @override
  Future<bool> updateRefreshToken(String refreshToken, {String? email}) {
    // TODO: implement updateRefreshToken
    throw UnimplementedError();
  }
}
