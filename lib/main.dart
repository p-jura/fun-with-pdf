import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_pdf/src/presentation/create_pdf/pdf_create_site.dart';
import 'package:fun_with_pdf/src/presentation/view_pdf/bloc/pdf_view_cubit.dart';
import 'package:fun_with_pdf/src/presentation/view_pdf/pdf_view_widget.dart';
import 'src/get_it_instance.dart' as gi;

void main() async {
  await gi.setupGetIt();
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
      home: BlocProvider(
        create: (_) => gi.getIt<PdfViewCubit>(),
        child: const NawigationBarWidget(),
      ),
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
    const PdfCreateSite(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.blue[100],
        onTap: (pageIndex) {
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
