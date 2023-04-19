import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fun_with_pdf/view_pdf/domain/usecases/get_data_from_file.dart';

@immutable
abstract class PdfViewState extends Equatable {}

class EmptyPdfViewState extends PdfViewState {
  @override
  List<Object?> get props => [];
}

class LoadedPdfViewState extends PdfViewState {
  final Uint8List dataFromFile;
    
  LoadedPdfViewState(this.dataFromFile);
  @override
  List<Object?> get props => [dataFromFile];
}
class PdfErrorState extends PdfViewState{
  final String message;

  PdfErrorState(this.message);
  @override
  List<Object?> get props => [message];

}
