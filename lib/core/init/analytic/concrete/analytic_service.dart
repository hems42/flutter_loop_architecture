import '../../../constant/enum/analytic/analytic_manager_types_enum.dart';
import '../abstract/ife_analytic_manager.dart';
import '../abstract/ife_analytic_service.dart';
import 'custom_analytic/analytic_manager_custom.dart';

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
  void dene2() {
    print("dene  den çıktı");
    _manager!.dene();
  }
}
