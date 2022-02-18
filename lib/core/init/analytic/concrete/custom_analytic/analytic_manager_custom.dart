// ignore_for_file: avoid_print

import 'package:flutter_notebook/core/init/analytic/abstract/ife_analytic_manager.dart';

class AnalyticManagerOfCustom implements IAnalyticManager {
  static AnalyticManagerOfCustom? _instance;
  static AnalyticManagerOfCustom? get instance {
    _instance ??= AnalyticManagerOfCustom._init();

    return _instance;
  }

  AnalyticManagerOfCustom._init();

  @override
  void dene() {
    print("custom_analitc denemeden selamlar...");
  }

  @override
  void dene2() {
    print("custom_analitc dene 2 denemeden selamlar...");
  }

  void yaz() {
    print("niye yazmıyor bu amına koduum");
  }
}
