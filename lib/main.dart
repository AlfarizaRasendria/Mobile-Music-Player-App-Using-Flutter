import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:versyll/Screens/Home.dart';
import 'package:versyll/Screens/Search.dart';
import 'package:versyll/Screens/SignUp.dart';
import 'package:versyll/Screens/User.dart';
import 'package:versyll/Screens/login.dart';
import 'package:versyll/Screens/SongDetail.dart';
import 'package:versyll/Screens/PlayList.dart';
import 'package:versyll/Screens/FormAddSong.dart';

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
      // home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/': (context) => HomePage(),
        '/register': (context) => SignUp(),
        '/user': (context) => UserPage(),
        '/song': (context) => SongDetail(),
        '/playlist': (context) => PlayListPage(),
        '/addsong': (context) => FormAddSong(),
      },
    );
  }
}



// ----------------------------------------------- Home






