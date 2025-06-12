import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  bool _isDarkMode= false;
  bool get isDarkMode => _isDarkMode;
  //ThemeMode get thememode=> _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme(){
    _isDarkMode= !_isDarkMode;
    notifyListeners();
  }
  ThemeData get thememode => _isDarkMode ? darkTheme : lightTheme;
  // 👇 Define your custom light theme
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.pink),titleMedium: TextStyle(color: Colors.pink)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlueAccent,
      ),
    ),
  );

  // this code for custome dark theme
ThemeData darkTheme= ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  scaffoldBackgroundColor: Color(0xFF121111),
  appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple),
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red)
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    ),
  ),

);
}