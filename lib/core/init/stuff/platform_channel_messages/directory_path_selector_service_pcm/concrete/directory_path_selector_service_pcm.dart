import '../../../../../constant/enum/system/path_selector_manager_types_enum.dart';
import '../abstract/ife_directory_path_selector_manager.dart';
import '../abstract/ife_directory_path_selector_service_pcm.dart';
import 'pigeon/directory_path_selector_manager_path_provider.dart';

class PathSelectorServicePCM implements IDirectoryPathSelectorServicePCM {
  static PathSelectorServicePCM? _instance;
  late final IDirectoryPathSelectorManager _manager;
  static PathSelectorServicePCM? get instance {
    _instance ??= PathSelectorServicePCM._init();
    return _instance;
  }

  PathSelectorServicePCM._init() {
    _manager = _selectManager(DirectoryPathSelectorManagerTypesEnum.PIGEON)!;
  }

  DirectoryPathSelectorManagerOfPigeon? _selectManager(
      DirectoryPathSelectorManagerTypesEnum types) {
    switch (types) {
      case DirectoryPathSelectorManagerTypesEnum.PIGEON:
        return DirectoryPathSelectorManagerOfPigeon.instance;

      default:
        return DirectoryPathSelectorManagerOfPigeon.instance;
    }
  }
}
