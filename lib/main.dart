import 'package:flutter/material.dart';

import 'create_pdf/presentation/pdf_create_widget.dart';
import 'view_pdf/presentation/pdf_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NawigationBarWidget(),
    );
  }
}

class NawigationBarWidget extends StatefulWidget {
  const NawigationBarWidget({super.key});

  @override
  State<NawigationBarWidget> createState() => _NawigationBarWidgetState();
}

class _NawigationBarWidgetState extends State<NawigationBarWidget> {
  int index = 0;
  final List pageList = [
    const PdfViewWidget(),
    const PdfCreateWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.blue[100],
        onTap: (pageIndex) {
          print('pageIndex = $pageIndex, index = $index');
          if (pageIndex <= pageList.length) {
            setState(() {
              index = pageIndex;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Load PDF',
            icon: Icon(
              Icons.upload_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Create PDF',
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: pageList[index],
    );
  }
}
