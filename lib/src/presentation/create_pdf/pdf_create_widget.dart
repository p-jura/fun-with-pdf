import 'package:flutter/material.dart';
import 'package:fun_with_pdf/src/constants.dart' as constants;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// Fun with positioning widgets, testing idea of controlling position of widgets in real time.

class PdfCreateWidget extends StatefulWidget {
  const PdfCreateWidget({super.key});

  @override
  State<PdfCreateWidget> createState() => _PdfCreateWidgetState();
}

class _PdfCreateWidgetState extends State<PdfCreateWidget> {
  final pdf = pw.Document();

  Offset? _gPosition;
  final List<Widget> _widgetsOnDocument = [];
  void savePositionAndCreateNewWidget(String textValue) {
    _widgetsOnDocument.add(
      Positioned(
        top: _gPosition!.dy,
        left: _gPosition!.dx,
        child: Text(textValue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(constants.CREATE_PDF_TITLE),
      ),
      body: GestureDetector(
        onTapDown: (position) {
          setState(() {
            _gPosition = position.localPosition;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(2, 2),
                color: Colors.black26,
              )
            ],
          ),
          child: Stack(
            children: [
              _gPosition == null
                  ? const Center(
                      child: Text(constants.TAP_SOMEWHARE),
                    )
                  : TextFormFieldPositioned(
                      position: _gPosition!,
                      saveFunction: savePositionAndCreateNewWidget,
                    ),
              ..._widgetsOnDocument,
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormFieldPositioned extends StatelessWidget {
  const TextFormFieldPositioned({
    super.key,
    required this.position,
    required this.saveFunction,
  });

  final Offset position;
  final Function(String) saveFunction;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 120,
      height: 30,
      top: position.dy,
      left: position.dx,
      child: TextFormField(
        onFieldSubmitted: saveFunction,
      ),
    );
  }
}
