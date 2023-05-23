import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versyll/Home.dart';
import 'package:versyll/Search.dart';
import 'package:versyll/SignUp.dart';
import 'package:versyll/User.dart';
import 'package:versyll/login.dart';
import 'package:versyll/SongDetail.dart';
import 'package:versyll/PlayList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginPage(),
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
        'SignUp': (context) => SignUp(),
        'User': (context) => UserPage(),
        'SongDetail': (context) => SongDetail(),
        'PlayList': (context) => PlayListPage(),
      },
    );
  } 
}



// ----------------------------------------------- Home






