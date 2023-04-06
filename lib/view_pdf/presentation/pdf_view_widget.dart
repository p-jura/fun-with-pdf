import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewWidget extends StatefulWidget {
  const PdfViewWidget({
    super.key,
  });
  static String route = '/pdf_view';
  @override
  State<PdfViewWidget> createState() => _PdfViewWidgetState();
}

class _PdfViewWidgetState extends State<PdfViewWidget> {
  final _title = 'View PDF';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SfPdfViewer.asset(
        'assets/example.pdf',
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {},
        tooltip: 'Load pdf',
        child: const Icon(Icons.add),
      ),
    );
  }
}
