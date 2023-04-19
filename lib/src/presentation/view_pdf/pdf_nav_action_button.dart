import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfNavActionButton extends StatefulWidget {
  const PdfNavActionButton({
    required this.onLoadImagePressed,
    required this.pdfViewerController,
    super.key,
  });
  final Function onLoadImagePressed;
  final PdfViewerController pdfViewerController;

  @override
  State<PdfNavActionButton> createState() => _PdfNavActionButtonState();
}

class _PdfNavActionButtonState extends State<PdfNavActionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(
        maxHeight: 90.0,
        maxWidth: 200.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.pdfViewerController.zoomLevel =
                    widget.pdfViewerController.zoomLevel + 0.5;
              });
            },
            icon: const Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.pdfViewerController.zoomLevel =
                    widget.pdfViewerController.zoomLevel - 0.5;
              });
            },
            icon: const Icon(
              Icons.zoom_out_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => widget.onLoadImagePressed(),
            icon: const Icon(
              Icons.upload_file,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
