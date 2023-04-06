import 'dart:io';
import 'dart:typed_data';

import 'package:fun_with_pdf/view_pdf/domain/entities.dart';

class PdfBytesModel extends PdfBytes {
  final Exception? exception;

  PdfBytesModel(
    data, [
    this.exception,
  ]) : super(data);

  factory PdfBytesModel.fromFile(File? file) {
    if (file == null) {
      throw Exception(
        [
          'File not found',
        ],
      );
    }
    return PdfBytesModel(
      file.readAsBytesSync(),
    );
  }
}
