import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' show immutable;

import 'package:fun_with_pdf/src/domain/view_pdf/repository/pdf_data_repository.dart';
import 'package:fun_with_pdf/core/fialure.dart';
import 'package:fun_with_pdf/src/domain/entities.dart';

@immutable
class DataFromFile {
  final PdfDataRepository repository;

  const DataFromFile(this.repository);

  Future<Either<Failure,PdfBytes>> call() {
    return repository.getDataFromFile();
  }
}
