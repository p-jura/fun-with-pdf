import 'dart:io';
import 'dart:typed_data';

import 'package:fun_with_pdf/core/fialure.dart';
import 'package:fun_with_pdf/src/constants.dart';
import 'package:fun_with_pdf/src/domain/entities.dart';

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

  // bool didFailed() => exception != null?
}
