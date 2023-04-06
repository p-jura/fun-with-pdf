import 'dart:io';

import 'package:file_picker/file_picker.dart';

File fixtureFile(String name) => File('assets/$name');
File? fixtureFilePicker(String name) {
  FilePickerResult result = FilePickerResult(
    [
      PlatformFile(name: name, size: 8, path: 'assets/$name'),
    ],
  );
  final fileType = result.files.first.extension;
  if (fileType == 'pdf') {
    print('File extension: $fileType');
    final path = result.files[0].path;
    return File(path ?? 'empty');
  }
  return null;
}
