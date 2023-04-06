import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fun_with_pdf/view_pdf/constants.dart';
import 'package:fun_with_pdf/view_pdf/core/fialure.dart';
import 'package:fun_with_pdf/view_pdf/data/model/pdf_bytes_model.dart';
import 'package:fun_with_pdf/view_pdf/domain/entities.dart';

import '../../fixture.dart';

void main() {
  final PdfBytesModel tPdfBytesModel = PdfBytesModel(
    Uint8List(10),
  );

  test(
    'should be a subclass of PdfBytes entity',
    () {
      expect(
        tPdfBytesModel,
        isA<PdfBytes>(),
      );
    },
  );
  group(
    'From file',
    () {
      test(
        'should return a valid model from example file',
        () async {
          final File file = fixtureFile('example.pdf');
          final modelToCompare = PdfBytesModel(await file.readAsBytes());
          final resoult = PdfBytesModel.fromFile(file);
          expect(resoult, modelToCompare);
        },
      );
      test(
        'should return a valid model if file is pdf file',
        () async {
          // arrange
          final File? file = fixtureFilePicker('example.pdf');
          final modelToCompare = PdfBytesModel(await file!.readAsBytes());
          // act
          final resoult = PdfBytesModel.fromFile(file);
          // assert
          expect(
            resoult,
            modelToCompare,
          );
        },
      );
      test(
        'should rerurn a valid model with failure message if file is not pdf',
        () async {
          // arrange
          final File? fileFromFilePicker = fixtureFilePicker('example.txt');
    
          // act
          final resoult = PdfBytesModel.fromFile(fileFromFilePicker);
          // assert
          expect(
            resoult.exception,
            Failure(exeptionFileTypeIsNotCorrect),
          );
        },
      );
    },
  );
}