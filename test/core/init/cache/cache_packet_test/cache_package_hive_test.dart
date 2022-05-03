import 'package:flutter_notebook/core/constants/app/application_static.dart';
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
}
