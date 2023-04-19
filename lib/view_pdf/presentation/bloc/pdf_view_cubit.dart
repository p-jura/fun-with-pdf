import 'package:bloc/bloc.dart';

import 'package:fun_with_pdf/view_pdf/domain/usecases/get_data_from_file.dart';
import 'package:fun_with_pdf/view_pdf/presentation/bloc/pdf_view_state.dart';

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
