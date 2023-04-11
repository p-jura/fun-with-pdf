import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fun_with_pdf/view_pdf/data/model/pdf_bytes_model.dart';

import 'data_source.dart';

class FilePickerDataSourceImpl implements FilePickerDataSource {
  final FilePicker dataPicker;

  FilePickerDataSourceImpl(this.dataPicker);
  @override
  Future<PdfBytesModel?> getFilePickerResoult() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      return PdfBytesModel(file);
    }
    return null;
  }
}
