import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:versyll/Screens/Home.dart';

import '../services/auth_service.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      body: Stack(
        children: [
          // Bg Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover),
            ),
          ),

          // Black Filter
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(140, 0, 0, 0),
            ),
          ),

          // Content
          ListView(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 100, left: 32, right: 32, bottom: 24),
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: InputField(
                  controller: emailController,
                  labelTxt: "Email",
                  isHidden: false,
                ),
              ),
              SizedBox(height: 36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: InputField(
                  controller: passwordController,
                  labelTxt: "Password",
                  isHidden: false,
                ),
              ),
              SizedBox(height: 36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () async {
                      await authService.createUserWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      );
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "or",
                      style: TextStyle(color: Colors.white54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/login');
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final labelTxt;
  final hintTxt;
  final controller;
  final isHidden;

  const InputField(
      {super.key, this.labelTxt, this.hintTxt, this.controller, this.isHidden});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.white,
      cursorWidth: 0.8,
      obscureText: isHidden,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black38,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelText: labelTxt,
        labelStyle: TextStyle(color: Colors.white54),
        hintText: hintTxt,
        hintStyle: TextStyle(color: Colors.white24),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
