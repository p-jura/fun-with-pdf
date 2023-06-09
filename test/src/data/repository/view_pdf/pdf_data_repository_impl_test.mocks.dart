// Mocks generated by Mockito 5.4.0 from annotations
// in fun_with_pdf/test/src/data/repository/view_pdf/pdf_data_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fun_with_pdf/src/data/model/pdf_bytes_model.dart' as _i4;
import 'package:fun_with_pdf/src/data/view_pdf/data_source/data_source.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FilePickerDataSource].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockFilePickerDataSource extends _i1.Mock
    implements _i2.FilePickerDataSource {
  @override
  _i3.Future<_i4.PdfBytesModel?> getFilePickerResoultAsModel() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFilePickerResoultAsModel,
          [],
        ),
        returnValue: _i3.Future<_i4.PdfBytesModel?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.PdfBytesModel?>.value(),
      ) as _i3.Future<_i4.PdfBytesModel?>);
}
