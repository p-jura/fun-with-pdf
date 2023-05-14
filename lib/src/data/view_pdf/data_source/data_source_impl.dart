import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:fun_with_pdf/core/fialure.dart';
import 'package:fun_with_pdf/src/constants.dart';
import 'package:fun_with_pdf/src/data/model/pdf_bytes_model.dart';

import 'data_source.dart';

class FilePickerDataSourceImpl implements FilePickerDataSource {
  @override
  Future<PdfBytesModel?> getFilePickerResoultAsModel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      return PdfBytesModel.fromFile(file);
    }
    return PdfBytesModel(Uint8List(0), Failure(NO_FILE_LODED_EXEPTION));
  }
}
