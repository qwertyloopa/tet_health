import 'package:flutter/material.dart';
import 'package:tet_health/screens/HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cardea",
      theme: ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.red,
        textTheme: GoogleFonts.rubikTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          titleTextStyle: GoogleFonts.rubik(fontSize: 20, color: Colors.red),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          selectedLabelStyle: GoogleFonts.rubik(),
        )
      ),
      home: HomeScreen(),
    );
  }
}


