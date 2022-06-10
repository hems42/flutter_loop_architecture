import 'package:flutter_notebook/core/constant/static/cache/cache_statics.dart';
import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_manager.dart';
import 'package:flutter_notebook/core/init/cache/concrete/hive/cache_manager_hive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  setUp(() {
    Hive.init(CacheConstants.CACHE_FOLDER_NAME);
  });

  test('tüm kayıtlar', () async {
    var box =
        await Hive.openBox(CacheConstants.CACHE_AUTHENTICATION_NAME);

    print("sayısı : " + box.length.toString());

    box.keys.forEach((element) {
      print("gelen key : " + element.toString());
      print("gelen değer : " + box.get(element.toString()));
    });

    await box.close();
  });

  test("tüm kayıtlar cachemanagar hive", () async {
    ICacheManager cacheService = CacheManagerOfHive.instance!;

    await cacheService.ensureInit();
  /*   var d = await cacheService.saveAccesToken("access token",
        email: "enflasyon@enflasyon"); */

    var b = await cacheService.getAccessToken(checkEmail: (email) {
      print("gelen email adresi : " + email.toString());
    });

    print("gelen token : " + b.toString());
  });

  test("access token", () async {
    ICacheManager cacheService = CacheManagerOfHive.instance!;
    var d = await cacheService.saveAccesToken("access token",
        email: "enflasyon@enflasyon");

    var b = await cacheService.getAccessToken(checkEmail: (email) {
      print("gelen email adresi : " + email.toString());
    });

    print("gelen token : " + b.toString());
  });

  test("ll", () async {
    ICacheManager cacheService = CacheManagerOfHive.instance!;

    var b = await cacheService.deleteAccesToken(
      email: "enflasyon@enflasyon",
      checkEmail: (email) {
        print("silinen email : " + email.toString());
      },
    );

    print("gelen silme sonucu : " + b.toString());
  });

  test("refresh token", () async {
    ICacheManager cacheService = CacheManagerOfHive.instance!;
    var d = await cacheService.saveRefreshToken("refresh token",
        email: "enflasyon@enflasyon");

    var b = await cacheService.getRefreshToken(checkEmail: (email) {
      print("gelen email adresi refresh token : " + email.toString());
    });

    print("gelen token refresjh token: " + b.toString());
  });
}
