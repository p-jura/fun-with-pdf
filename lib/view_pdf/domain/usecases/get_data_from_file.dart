import 'package:flutter/material.dart' show immutable;
import 'package:fun_with_pdf/view_pdf/domain/repository/pdf_data_repository.dart';

import '../entities.dart';

@immutable
class DataFromFile {
  final PdfDataRepository repository;

  const DataFromFile(this.repository);

  Future<PdfBytes> call() {
    return repository.getDataFromFile();
  }
}
