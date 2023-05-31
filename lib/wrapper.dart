import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:versyll/Models/user_model.dart';
import 'package:versyll/Screens/Home.dart';
import 'package:versyll/Screens/login.dart';
import 'package:versyll/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authSevice = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authSevice.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? LoginPage() : HomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
