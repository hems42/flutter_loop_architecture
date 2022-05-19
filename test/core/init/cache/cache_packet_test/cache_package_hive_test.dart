import 'package:flutter_notebook/core/constant/static/app/application_statics.dart';
import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_manager.dart';
import 'package:flutter_notebook/core/init/cache/concrete/hive/cache_manager_hive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  setUp(() {
    Hive.init(ApplicationConstants.CACHE_FOLDER_NAME);
  });

  test('ffgf', () async {
    var box =
        await Hive.openBox(ApplicationConstants.CACHE_AUTHENTICATION_NAME);

    print("sayısı : " + box.length.toString());
   
    box.keys.forEach((element) {
      print("gelen key : " + element.toString());
      print("gelen değer : " + box.get(element.toString()));
    });

    await box.close();
  });

  test("ıhı", () async {
    ICacheManager cacheService = CacheManagerOfHive.instance!;
    var d = await cacheService.saveAccesToken("uzanan iki el",
        email: "enflasyon@enflasyon");

    var b = await cacheService.getAccessToken(checkEmail: (email) {
      print("gelen email adresi : " + email.toString());
    });

    print("gelen token : " + b.toString());
  });

  test("ll", () async {
    ICacheManager cacheService = CacheManagerOfHive.instance!;

    var b =
        await cacheService.deleteAccesToken();

    print("gelen silme sonucu : " + b.toString());
  });
}
