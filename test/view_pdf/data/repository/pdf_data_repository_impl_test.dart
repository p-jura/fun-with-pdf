import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:fun_with_pdf/view_pdf/constants.dart';
import 'package:fun_with_pdf/view_pdf/core/fialure.dart';
import 'package:fun_with_pdf/view_pdf/data/data_source/data_source.dart';
import 'package:fun_with_pdf/view_pdf/data/model/pdf_bytes_model.dart';
import 'package:fun_with_pdf/view_pdf/data/repository/pdf_data_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks(
  [
    MockSpec<FilePickerDataSource>(),
  ],
)
import './pdf_data_repository_impl_test.mocks.dart';

void main() {
  late MockFilePickerDataSource dataSource;
  late PdfDataRepositoryImpl repositoryImpl;
  final PdfBytesModel tPdfModel = PdfBytesModel(Uint8List(8));

  setUp(
    () {
      dataSource = MockFilePickerDataSource();
      repositoryImpl = PdfDataRepositoryImpl(dataSource);
    },
  );
  test(
    'should return mocked data frome file when dataFromFile is called',
    () async {
      when(dataSource.getFilePickerResoultAsModel()).thenAnswer(
        (_) async => tPdfModel,
      );
      final resoult = await repositoryImpl.getDataFromFile();
      verify(dataSource.getFilePickerResoultAsModel());
      expect(
        resoult,
        equals(Right(tPdfModel)),
      );
    },
  );
  test(
    '''should return failure with message failedToLoadFile
       when file picker gives null responce)''',
    () async {
      when(dataSource.getFilePickerResoultAsModel()).thenAnswer(
        (_) async => null,
      );
      final resoult = await repositoryImpl.getDataFromFile();
      expect(
        resoult,
        equals(
          Left(
            Failure(failedToLoadFile),
          ),
        ),
      );
    },
  );
  test(
    '''should return failure with message noFileLoadedExeption
       when file picker was canceled)''',
    () async {
      when(dataSource.getFilePickerResoultAsModel()).thenAnswer(
        (_) async => Future.value(
          PdfBytesModel(
            Uint8List(8),
            Failure(noFileLoadedExeption),
          ),
        ),
      );
      final resoult = await repositoryImpl.getDataFromFile();
      expect(
        resoult,
        equals(
          Left(
            Failure(noFileLoadedExeption),
          ),
        ),
      );
    },
  );
}
