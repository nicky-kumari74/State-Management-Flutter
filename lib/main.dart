import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/home.dart';
import 'package:state_management/provider/notes_provider.dart';
import 'package:state_management/provider/theme_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>NotesProvider()..loadNotes()),
    ChangeNotifierProvider(create: (context)=>ThemeProvider())
  ],
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
      //themeMode: Provider.of<ThemeProvider>(context).thememode,
      theme: Provider.of<ThemeProvider>(context).thememode,
      //darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

