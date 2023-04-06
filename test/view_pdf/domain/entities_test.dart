import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fun_with_pdf/view_pdf/domain/entities.dart';

void main() {
  late PdfBytes classUnderTest;
  late PdfBytes classToCompare;
  final Uint8List data = Uint8List(10);
  final Uint8List secondData = Uint8List(8);

  setUp(() {
    classUnderTest = PdfBytes(data);
    classToCompare = PdfBytes(data);
  });

  test('should return true if both instances are equal', () {
    expect(classUnderTest, classToCompare);
  });

  test('should return false if both instances are equal', () {
    classToCompare = PdfBytes(secondData);
    expect(classUnderTest, isNot(classToCompare));
  });
}
