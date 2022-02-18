import 'package:flutter_notebook/core/constants/enum/analytic_manager_types_enum.dart';
import 'package:flutter_notebook/core/init/analytic/abstract/ife_analytic_manager.dart';
import 'package:flutter_notebook/core/init/analytic/abstract/ife_analytic_service.dart';
import 'package:flutter_notebook/core/init/analytic/concrete/custom_analytic/analytic_manager_custom.dart';

class AnalyticService implements IAnalyticService {
  static AnalyticService? _instance;
  late final IAnalyticManager? _manager;
  static AnalyticService? get instance {
    _instance ??= AnalyticService._init();
    return _instance;
  }

  AnalyticService._init() {
    _manager = _selectManager(AnalyticManagerTypes.CUSTOM);
  }

  IAnalyticManager? _selectManager(AnalyticManagerTypes types) {
    switch (types) {
      case AnalyticManagerTypes.CUSTOM:
        return AnalyticManagerOfCustom.instance;

      default:
        return AnalyticManagerOfCustom.instance;
    }
  }

  @override
  void dene2() {print("dene  den çıktı");
    _manager!.dene();
    
  }
}
