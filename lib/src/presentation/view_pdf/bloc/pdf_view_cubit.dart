import 'package:bloc/bloc.dart';

import 'package:fun_with_pdf/src/domain/view_pdf/usecases/get_data_from_file.dart';
import 'package:fun_with_pdf/src/presentation/view_pdf/bloc/pdf_view_state.dart';

class PdfViewCubit extends Cubit<PdfViewState> {
  final DataFromFile dataFromFile;

  PdfViewCubit({required this.dataFromFile}) : super(EmptyPdfViewState());
  void openPdf() async {
    var pdfData = await dataFromFile.call();
    pdfData.fold(
      (error) => emit(
        PdfErrorState(
          error.message,
        ),
      ),
      (loaded) => emit(
        LoadedPdfViewState(
          loaded.data,
        ),
      ),
    );
  }

}
