import 'package:fun_with_pdf/view_pdf/domain/entities.dart';
import 'package:fun_with_pdf/view_pdf/core/fialure.dart';
import 'package:dartz/dartz.dart';
import 'package:fun_with_pdf/view_pdf/domain/repository/pdf_data_repository.dart';

class PdfDataRepositoryImpl implements PdfDataRepository{
  @override
  Future<Either<Failure, PdfBytes>> getDataFromFile() {
    // TODO: implement getDataFromFile
    throw UnimplementedError();
  }
}