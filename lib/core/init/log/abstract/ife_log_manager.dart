import 'dart:io';
import '../../../constant/enum/log/log_levels_enum.dart';
import 'ife_log_service.dart';
import 'package:path_provider/path_provider.dart';

mixin ILogManager implements ILogService {
  final selectedLogLevelToOutput = LogLevelEnum.ERROR;

  // ignore: non_constant_identifier_names
  Future<void> outputLogToFile(List<String> logList) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    var file = File(appDocPath + '\logs.txt');

    if (!file.existsSync()) {
      file.create(recursive: false);
    }

    file.writeAsString(logList.toString());
  }

  // ignore: non_constant_identifier_names
  void outputLogToRemote(List<String> logList) {}

  // log tiplerini belirle

  // log kayıt yeri belirle

  // log  kayıt tipi belirle

  // log alma sıklığı vs conf ayarları...

  //  ..............
}
