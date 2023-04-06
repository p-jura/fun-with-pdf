import 'dart:typed_data' show Uint8List;

class PdfBytes {
  final Uint8List data;

  PdfBytes(this.data);

  @override
  bool operator ==(covariant PdfBytes other) {
    if (data.length != other.data.length) {
      return false;
    }
    for (var i = 0; i < data.length; i++) {
      if (data[i] != other.data[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode => data.hashCode;
}

