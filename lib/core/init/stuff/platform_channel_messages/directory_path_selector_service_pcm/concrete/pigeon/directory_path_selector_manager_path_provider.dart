import '../../abstract/ife_directory_path_selector_manager.dart';

class DirectoryPathSelectorManagerOfPigeon with IDirectoryPathSelectorManager {
  static DirectoryPathSelectorManagerOfPigeon? _instance;
  static DirectoryPathSelectorManagerOfPigeon? get instance {
    _instance ??= DirectoryPathSelectorManagerOfPigeon._init();
    return _instance;
  }

  DirectoryPathSelectorManagerOfPigeon._init();
}
