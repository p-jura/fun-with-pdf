import 'dart:io';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fun_with_pdf/src/constants.dart' as constants;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// Fun with positioning widgets, testing idea of controlling position of widgets in real time.

class PdfCreateSite extends StatefulWidget {
  const PdfCreateSite({super.key});

  @override
  State<PdfCreateSite> createState() => _PdfCreateSiteState();
}

class _PdfCreateSiteState extends State<PdfCreateSite> {
  Offset? _gPosition;
  final List<Widget> _widgetsOnDocument = [];
  final List<pw.Widget> _pwWidgetsOnDocument = [];
  final TextEditingController tController = TextEditingController();

  bool isTxtButtonPressed = false;

  void savePositionAndCreateNewWidget(String textValue) {
    _widgetsOnDocument.add(
      Positioned(
        top: _gPosition!.dy,
        left: _gPosition!.dx,
        child: Center(child: Text(textValue)),
      ),
    );
    _pwWidgetsOnDocument.add(
      pw.Positioned(
        top: _gPosition!.dy,
        left: _gPosition!.dx,
        child: pw.Center(
          child: pw.Text(
            textValue,
            style: pw.TextStyle(
              font: pw.Font.helvetica(),
            ),
          ),
        ),
      ),
    );
  }

  void pickTextTool() {
    setState(() {
      isTxtButtonPressed = !isTxtButtonPressed;
    });
  }
  // draft for testing 
  void savePdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Center(
            child: pw.Container(
              padding: const pw.EdgeInsets.all(10),
              child: pw.Stack(children: [..._pwWidgetsOnDocument]),
            ),
          );
        },
      ),
    );
    
    var file = await File('test.pdf').create();
    if (file.existsSync()) {
      await file.writeAsBytes(await pdf.save(), mode: FileMode.append);
      print('file saved');
    } else {
      print('file not saved');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(constants.CREATE_PDF_TITLE),
        actions: [
          IconButton(
            onPressed: pickTextTool,
            icon: Icon(
              Icons.text_fields,
              color: isTxtButtonPressed == true ? Colors.red : Colors.white,
            ),
          ),
          IconButton(
            onPressed: savePdf,
            icon: const Icon(Icons.save_alt),
          )
        ],
      ),
      body: GestureDetector(
        onTapDown: (position) {
          setState(() {
            _gPosition = position.localPosition;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(10),
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
              isTxtButtonPressed
                  ? _gPosition == null
                      ? const Center(
                          child: Text(constants.TAP_SOMEWHARE),
                        )
                      : PositionedTextFormField(
                          position: _gPosition!,
                          saveFunction: savePositionAndCreateNewWidget,
                        )
                  : const Center(
                      child: Text(constants.PICK_A_TOOL),
                    ),
              ..._widgetsOnDocument,
            ],
          ),
        ),
      ),
    );
  }
}

class PositionedTextFormField extends StatelessWidget {
  const PositionedTextFormField({
    super.key,
    required this.position,
    required this.saveFunction,
    this.userSize,
  });

  final Offset position;
  final Function(String) saveFunction;
  final Size? userSize;
  // final Size defoultSize = const Size(120, 30);

  @override
  Widget build(BuildContext context) {
    final Size defoultSize = Size(MediaQuery.of(context).size.width / 3,
        MediaQuery.of(context).size.height / 16);
    final TextEditingController txtController = TextEditingController();
    print(position);

    return Positioned(
      width: userSize == null ? defoultSize.width : userSize?.width,
      height: userSize == null ? defoultSize.height : userSize?.height,
      top: position.dy - defoultSize.height / 2,
      left: position.dx - defoultSize.width / 2,
      child: TextFormField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
          ),
        ),
        controller: txtController,
        maxLength: userSize == null
            ? (defoultSize.width) ~/ 10
            : (userSize!.width) ~/ 10,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        onFieldSubmitted: saveFunction,
      ),
    );
  }
}
