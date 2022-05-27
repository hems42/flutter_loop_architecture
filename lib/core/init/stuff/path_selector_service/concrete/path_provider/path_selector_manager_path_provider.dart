import '../../abstract/ife_path_selector_manager.dart';

class PathSelectorManagerOfPathProvider with IPathSelectorManager {
  static PathSelectorManagerOfPathProvider? _instance;
  static PathSelectorManagerOfPathProvider? get instance {
    _instance ??= PathSelectorManagerOfPathProvider._init();
    return _instance;}
  PathSelectorManagerOfPathProvider._init();
}
