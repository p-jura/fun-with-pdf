// Mocks generated by Mockito 5.4.0 from annotations
// in fun_with_pdf/test/view_pdf/data/data_source/data_source_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:file_picker/file_picker.dart' as _i2;
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

/// A class which mocks [FilePicker].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilePicker extends _i1.Mock implements _i2.FilePicker {
  @override
  _i3.Future<_i2.FilePickerResult?> pickFiles({
    _i2.FileType? type = _i2.FileType.any,
    List<String>? allowedExtensions,
    dynamic Function(_i2.FilePickerStatus)? onFileLoading,
    bool? allowCompression = true,
    bool? allowMultiple = false,
    bool? withData = false,
    bool? withReadStream = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickFiles,
          [],
          {
            #type: type,
            #allowedExtensions: allowedExtensions,
            #onFileLoading: onFileLoading,
            #allowCompression: allowCompression,
            #allowMultiple: allowMultiple,
            #withData: withData,
            #withReadStream: withReadStream,
          },
        ),
        returnValue: _i3.Future<_i2.FilePickerResult?>.value(),
        returnValueForMissingStub: _i3.Future<_i2.FilePickerResult?>.value(),
      ) as _i3.Future<_i2.FilePickerResult?>);
  @override
  _i3.Future<bool?> clearTemporaryFiles() => (super.noSuchMethod(
        Invocation.method(
          #clearTemporaryFiles,
          [],
        ),
        returnValue: _i3.Future<bool?>.value(),
        returnValueForMissingStub: _i3.Future<bool?>.value(),
      ) as _i3.Future<bool?>);
  @override
  _i3.Future<String?> getDirectoryPath() => (super.noSuchMethod(
        Invocation.method(
          #getDirectoryPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
}
