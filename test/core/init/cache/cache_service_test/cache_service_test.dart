import 'package:flutter_notebook/core/init/cache/abstract/ife_cache_service.dart';
import 'package:flutter_notebook/core/init/cache/concrete/cache_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test', () async {
    ICacheService cacheService = CacheService.instance;
    //cacheService.saveAccesToken("Deneme Token");

    await cacheService.getAccesToken().then((value) {
      print("gelen token : " + value);
    });
  });
}
