import 'package:flutter/material.dart';

const createPdfTitle = 'Create pdf';
const notImplemented = 'Sorry this module is not implemented yet';

class PdfCreateWidget extends StatelessWidget {
  const PdfCreateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(createPdfTitle),
      ),
      body: const Center(
        child: Text(notImplemented),
      ),
    );
  }
}
