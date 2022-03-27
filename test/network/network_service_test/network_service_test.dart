// ignore_for_file: unused_local_variable

import 'package:flutter_notebook/core/init/network/abstract/ife_network_service.dart';
import 'package:flutter_notebook/core/init/network/concrete/network_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late INetworService networService;
  setUp(() {
    networService = NetworkService.instance;
  });

  group("network service base requirrements test", () {
    test("response parser work", () {
  
     // networService.fetch("", type: HttpRequestTypes.GET, parseModel: )
    });
  });
}
