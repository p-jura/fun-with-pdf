import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_pdf/view_pdf/get_it_instance.dart';
import 'package:fun_with_pdf/view_pdf/presentation/bloc/pdf_view_cubit.dart';
import 'package:fun_with_pdf/view_pdf/presentation/bloc/pdf_view_state.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewWidget extends StatefulWidget {
  const PdfViewWidget({
    super.key,
  });
  static String route = '/pdf_view';
  @override
  State<PdfViewWidget> createState() => _PdfViewWidgetState();
}

class _PdfViewWidgetState extends State<PdfViewWidget> {
  final _title = 'View PDF';
  late Uint8List loadedPdfData;
  late String errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PdfViewCubit, PdfViewState>(
      builder: (context, state) {
        if (state is LoadedPdfViewState) {
          loadedPdfData = state.dataFromFile;
        } else if (state is PdfErrorState) {
          errorMessage = state.message;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: state is EmptyPdfViewState
              ? SfPdfViewer.asset(
                  'assets/example.pdf',
                )
              : state is LoadedPdfViewState
                  ? SfPdfViewer.memory(loadedPdfData)
                  : Center(
                      child: Text(errorMessage),
                    ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              getIt<PdfViewCubit>().openPdf();
            },
            tooltip: 'Load pdf',
            child: const Icon(Icons.upload),
          ),
        );
      },
    );
  }
}
