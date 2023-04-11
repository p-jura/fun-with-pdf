import 'package:flutter/material.dart' show immutable;
import 'package:fun_with_pdf/view_pdf/data/model/pdf_bytes_model.dart';

@immutable
abstract class FilePickerDataSource {
  /// Calls the [file_picker] package to get data from device memmory
  Future<PdfBytesModel?> getFilePickerResoult();
}
