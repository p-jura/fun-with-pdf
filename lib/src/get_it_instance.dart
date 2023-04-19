import 'package:fun_with_pdf/src/data/view_pdf/data_source/data_source.dart';
import 'package:fun_with_pdf/src/data/view_pdf/data_source/data_source_impl.dart';
import 'package:fun_with_pdf/src/data/view_pdf/repository/pdf_data_repository_impl.dart';
import 'package:fun_with_pdf/src/domain/view_pdf/repository/pdf_data_repository.dart';
import 'package:fun_with_pdf/src/domain/view_pdf/usecases/get_data_from_file.dart';
import 'package:fun_with_pdf/src/presentation/view_pdf/bloc/pdf_view_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // features - pdf_view

  // datasource
  getIt.registerSingleton<FilePickerDataSource>(
    FilePickerDataSourceImpl(),
  );
  // repository
  getIt.registerFactory<PdfDataRepository>(
    () => PdfDataRepositoryImpl(
      getIt(),
    ),
  );
  // usecase
  getIt.registerFactory<DataFromFile>(
    () => DataFromFile(
      getIt(),
    ),
  );

  // cubit
  getIt.registerSingleton<PdfViewCubit>(
    PdfViewCubit(
      dataFromFile: getIt(),
    ),
  );
}
