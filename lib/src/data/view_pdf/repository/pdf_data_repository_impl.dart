import 'package:dartz/dartz.dart';

import 'package:fun_with_pdf/core/fialure.dart';
import 'package:fun_with_pdf/src/constants.dart';
import 'package:fun_with_pdf/src/data/view_pdf/data_source/data_source.dart';
import 'package:fun_with_pdf/src/domain/entities.dart';
import 'package:fun_with_pdf/src/domain/view_pdf/repository/pdf_data_repository.dart';

class PdfDataRepositoryImpl implements PdfDataRepository {
  final FilePickerDataSource dataSource;

  PdfDataRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, PdfBytes>> getDataFromFile() async {
    final response = await dataSource.getFilePickerResoultAsModel();
    if (response == null) {
      return Left(
        Failure(failedToLoadFile),
      );
    } else if (response.exception != null) {
      return Left(
        Failure(noFileLoadedExeption),
      );
    }
    return Right(response);
  }
}
