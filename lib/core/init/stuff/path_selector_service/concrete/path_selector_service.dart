import '../abstract/ife_path_selector_manager.dart';
import '../abstract/ife_path_selector_service.dart';
import 'path_provider/path_selector_manager_path_provider.dart';
import '../../../../constant/enum/system/path_selector_manager_types_enum.dart';

class PathSelectorService implements IPathSelectorService {
  static PathSelectorService? _instance;
  late final IPathSelectorManager _manager;
  static PathSelectorService? get instance {
    _instance ??= PathSelectorService._init();
    return _instance;
  }

  PathSelectorService._init() {
    _manager = _selectManager(PathSelectorManagerTypesEnum.PATH_PROVIDER)!;
  }

  PathSelectorManagerOfPathProvider? _selectManager(PathSelectorManagerTypesEnum types) {
    switch (types) {
      case PathSelectorManagerTypesEnum.PATH_PROVIDER:
        return PathSelectorManagerOfPathProvider.instance;
       
      default:
      return PathSelectorManagerOfPathProvider.instance;
    }
  }
}
