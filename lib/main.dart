import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/home.dart';
import 'package:state_management/provider/notes_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NotesProvider()..loadNotes(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

