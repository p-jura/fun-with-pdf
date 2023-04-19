import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' show immutable;
import 'package:fun_with_pdf/core/fialure.dart';
import 'package:fun_with_pdf/src/domain/entities.dart';



/// Abstract class, a contrakt for usecases to fulfill
@immutable
abstract class PdfDataRepository {
  Future<Either<Failure, PdfBytes>> getDataFromFile();
}
