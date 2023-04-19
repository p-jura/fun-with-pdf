import 'package:fun_with_pdf/view_pdf/data/data_source/data_source.dart';
import 'package:fun_with_pdf/view_pdf/data/data_source/data_source_impl.dart';
import 'package:fun_with_pdf/view_pdf/data/repository/pdf_data_repository_impl.dart';
import 'package:fun_with_pdf/view_pdf/domain/repository/pdf_data_repository.dart';
import 'package:fun_with_pdf/view_pdf/domain/usecases/get_data_from_file.dart';
import 'package:fun_with_pdf/view_pdf/presentation/bloc/pdf_view_cubit.dart';
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
