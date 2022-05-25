// ignore_for_file: prefer_final_fields

import 'package:logger/logger.dart';

class FileLogOutput extends LogOutput {
  Function _fileOutputFunction;

  FileLogOutput(this._fileOutputFunction);

  @override
  void output(OutputEvent event) {
    _fileOutputFunction.call(event.lines);
  }
}
