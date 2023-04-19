import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fun_with_pdf/view_pdf/core/fialure.dart';
import 'package:fun_with_pdf/view_pdf/domain/entities.dart';
import 'package:fun_with_pdf/view_pdf/domain/usecases/get_data_from_file.dart';
import 'package:fun_with_pdf/view_pdf/presentation/bloc/pdf_view_cubit.dart';
import 'package:fun_with_pdf/view_pdf/presentation/bloc/pdf_view_state.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
@GenerateNiceMocks([MockSpec<DataFromFile>()])
import './pdf_view_cubit_test.mocks.dart';

void main() {
  late PdfViewCubit cubit;
  late DataFromFile dataFromFileUscase;
  const String failureTest = 'Failure';
  setUp(() {
    dataFromFileUscase = MockDataFromFile();
    cubit = PdfViewCubit(dataFromFile: dataFromFileUscase);
  });

  blocTest<PdfViewCubit, PdfViewState>(
    'initial state of cubit',
    build: () => cubit,
    verify: (cub) => expect(
      cub.state,
      equals(
        EmptyPdfViewState(),
      ),
    ),
  );
  blocTest<PdfViewCubit, PdfViewState>(
    'When openPdf() is called should return LoadPdfViewState',
    build: () => cubit,
    setUp: () {
      when(dataFromFileUscase.call()).thenAnswer(
        (_) async => Right(
          PdfBytes(
            Uint8List(0),
          ),
        ),
      );
    },
    act: (cub) => cub.openPdf(),
    verify: (cub) => cub.state is LoadedPdfViewState,
  );
  blocTest<PdfViewCubit, PdfViewState>(
    '''When openPdf() is called and dataFromeFile 
    is Right should return LoadPdfViewState with Uint8List''',
    setUp: () {
      when(dataFromFileUscase.call()).thenAnswer(
        (_) async => Right(
          PdfBytes(
            Uint8List(0),
          ),
        ),
      );
    },
    build: () => cubit,
    act: (cub) => cub.openPdf(),
    expect: () => [
      LoadedPdfViewState(
        Uint8List(0),
      ),
    ],
  );
  blocTest(
    '''when openPdf() is called, should emmit error 
    state with message loaded frome Failure''',
    build: () => cubit,
    setUp: () => when(dataFromFileUscase.call()).thenAnswer(
      (_) async => Left(
        Failure(failureTest),
      ),
    ),
    act: (cub) => cub.openPdf(),
    verify: (cub) => cub.state is PdfErrorState,
    expect: () => [
      PdfErrorState(failureTest),
    ],
  );
}
