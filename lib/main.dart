import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:versyll/Screens/Home.dart';
import 'package:versyll/Screens/Search.dart';
import 'package:versyll/Screens/SignUp.dart';
import 'package:versyll/Screens/User.dart';
import 'package:versyll/Screens/login.dart';
import 'package:versyll/Screens/SongDetail.dart';
import 'package:versyll/Screens/PlayList.dart';
import 'package:versyll/Screens/FormAddSong.dart';
import 'package:versyll/services/auth_service.dart';
import 'package:versyll/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        // home: LoginPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/': (context) => Wrapper(),
          '/register': (context) => SignUp(),
          '/user': (context) => UserPage(),
          '/song': (context) => SongDetail(),
          '/playlist': (context) => PlayListPage(),
          '/addsong': (context) => FormAddSong(),
        },
      ),
    );
  }
}



// ----------------------------------------------- Home






