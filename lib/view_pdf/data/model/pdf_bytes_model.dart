import 'dart:io';
import 'dart:typed_data';

import 'package:fun_with_pdf/view_pdf/core/fialure.dart';
import 'package:fun_with_pdf/view_pdf/domain/entities.dart';

import '../../constants.dart';

class PdfBytesModel extends PdfBytes {
  final Failure? exception;

  PdfBytesModel(
    data, [
    this.exception,
  ]) : super(data);

  factory PdfBytesModel.fromFile(File? file) {
    if (file == null) {
      return PdfBytesModel(
        Uint8List(0),
        Failure(exeptionFileTypeIsNotCorrect),
      );
    }
    return PdfBytesModel(
      file.readAsBytesSync(),
    );
  }
}
