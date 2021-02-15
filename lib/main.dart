import 'package:criptically/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criptically',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      //TODO: Add floating button for information about the code and ciphers
      //TODO: Also make a floating copy button PS. THE SNACK BAR IS NOT WORKING!
      home: HomeScreen(),
    );
  }
}