import 'package:flutter_notebook/core/constant/static/app/application_statics.dart';
import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_service.dart';
import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';
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
    print("token : " + box.getAt(0));
    box.keys.forEach((element) {
      print("gelen değer : " + box.get(element.toString()));
    });
  });

  test("ıhı", () async {
    ICacheService cacheService = CacheService.instance;
    await cacheService.saveAccesToken("enflasyon", email: "enflasyon@enflsyon");

    var b = await cacheService.getAccessTokenEmail(checkEmail: (email) {
      print("gelen email adresi : "+ email!);
    });
  });
}
