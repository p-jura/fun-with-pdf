import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' show immutable;

import '../../core/fialure.dart';
import '../entities.dart';

/// Abstract class, a contrakt for usecases to fulfill
@immutable
abstract class PdfDataRepository {
  Future<Either<Failure, PdfBytes>> getDataFromFile();
}
