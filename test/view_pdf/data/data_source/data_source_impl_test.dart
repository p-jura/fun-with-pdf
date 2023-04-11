import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mockito/mockito.dart';

import 'package:fun_with_pdf/view_pdf/data/data_source/data_source_impl.dart';
import 'package:fun_with_pdf/view_pdf/data/model/pdf_bytes_model.dart';
import '../../fixture.dart';

@GenerateNiceMocks([MockSpec<FilePicker>()])
import './data_source_impl_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFilePicker mockFilePicker;
  late FilePickerDataSourceImpl dataSource;
  late final PdfBytesModel pdfBytesModel;
  final File mockedFile = fixtureFile('example.pdf');
  setUp(
    () {
      mockFilePicker = MockFilePicker();
      dataSource = FilePickerDataSourceImpl(mockFilePicker);
      pdfBytesModel = PdfBytesModel.fromFile(mockedFile);
    },
  );
  test(
    'should return mocked FilePickerResoult when getFilePickerResoult is called',
    () async {
      when(mockFilePicker.pickFiles()).thenAnswer(
        (_) async => FilePickerResult(
          [
            PlatformFile(name: 'example.pdf', size: 8, path: mockedFile.path),
          ],
        ),
      );
      final resoult = await dataSource.getFilePickerResoult();

      // verify(mockFilePicker.pickFiles());
      // expect(resoult, pdfBytesModel);
    },
  );
}
