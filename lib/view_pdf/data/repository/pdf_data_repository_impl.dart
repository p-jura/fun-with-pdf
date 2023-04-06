import 'package:fun_with_pdf/view_pdf/domain/entities.dart';
import 'package:fun_with_pdf/view_pdf/core/fialure.dart';
import 'package:dartz/dartz.dart';
import 'package:fun_with_pdf/view_pdf/domain/repository/pdf_data_repository.dart';

import '../data_source/data_source.dart';

class PdfDataRepositoryImpl implements PdfDataRepository {
  final FilePickerDataSource dataSource;

  PdfDataRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, PdfBytes>> getDataFromFile() async {
    return Right(dataSource.getDataFromFile());
  }
}