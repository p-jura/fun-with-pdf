import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:fun_with_pdf/view_pdf/core/fialure.dart';
import 'package:fun_with_pdf/view_pdf/domain/entities.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fun_with_pdf/view_pdf/domain/repository/pdf_data_repository.dart';
import 'package:fun_with_pdf/view_pdf/domain/usecases/get_data_from_file.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<PdfDataRepository>()])
import 'get_data_from_file_test.mocks.dart';

void main() {
  late PdfDataRepository repository;
  late DataFromFile usecase;
  final Uint8List data = Uint8List(1);
  const String tFailureMessage = 'test';
  setUp(() {
    repository = MockPdfDataRepository();
    usecase = DataFromFile(repository);
  });
  test(
    'Should get PdfByte from repository',
    () async {
      when(repository.getDataFromFile()).thenAnswer(
        (_) => Future.value(
          Right(
            PdfBytes(data),
          ),
        ),
      );
      final resoult = await usecase();

      expect(
        resoult,
        Right(
          PdfBytes(data),
        ),
      );
      verify(
        repository.getDataFromFile(),
      );
    },
  );
  test(
    'Should get Failure frome repository',
    () async {
      when(repository.getDataFromFile()).thenAnswer(
        (_) async => Left(
          Failure(tFailureMessage),
        ),
      );
      final resoult = await usecase.call();
      expect(
        resoult,
        equals(
          Left(
            Failure(tFailureMessage),
          ),
        ),
      );
    },
  );
}
