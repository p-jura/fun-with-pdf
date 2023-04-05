import 'package:flutter/material.dart';

import 'view_pdf/presentation/pdf_view_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  final List pageList = [const PdfViewWidget()];

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return MaterialApp(
      title: 'PDF app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue[100],
          onTap: (pageIndex) {
            if (pageList.length <= index) {
              index = pageIndex;
            }
          },
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'Load PDF',
              icon: Icon(Icons.upload_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Create PDF',
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        body: pageList[index],
      ),
    );
  }
}
