import 'package:flutter/material.dart' show immutable;

import '../entities.dart';


/// Abstract class, a contrakt for usecases to fulfill
@immutable abstract class PdfDataRepository{
  Future<PdfBytes> getDataFromFile();
}