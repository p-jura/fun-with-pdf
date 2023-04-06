import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fun_with_pdf/view_pdf/domain/entities.dart';

void main() {
  late final PdfBytes classUnderTest;
  late final PdfBytes classToCompare;
  final Uint8List data = Uint8List(10);
  final Uint8List secondData = Uint8List(8);

  test('should return true if both instances are equal', () {
    classUnderTest = PdfBytes(data);
    classToCompare = PdfBytes(data);
    expect(classUnderTest, classToCompare);
  });

  test('should return false if both instances are equal', () {
    classUnderTest = PdfBytes(data);
    classToCompare = PdfBytes(secondData);
    expect(classUnderTest, isNot(classToCompare));
  });
}
