import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:versyll/Models/user_model.dart';

class AuthService with ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  String tempToken = "";
  String token = "";
  String uid = "";
  var name;
  var email;

  List<User> detail = [];

  String get userid {
    return uid;
  }

  String tempData() {
    refreshToken();
    token = tempToken;
    //print(token);
    return token;
  }

  Future<void> refreshToken() async {
    tempToken = await _firebaseAuth.currentUser!.getIdToken(true);
    token = tempToken;
  }

  String get userid {
    return uid;
  }

  String tempData() {
    refreshToken();
    token = tempToken;
    //print(token);
    return token;
  }

  Future<void> refreshToken() async {
    tempToken = await FirebaseAuth.instance.currentUser!.getIdToken(true);
    token = tempToken;
  }

  UserAttribute? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserAttribute(user.uid, user.email);
  }

  Stream<UserAttribute?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserAttribute?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    getUserDetail();
    return _userFromFirebase(credential.user);
  }

  Future<UserAttribute?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    getUserDetail();
    return _userFromFirebase(credential.user);
  }

  Future<User?> updateUser(String name) async {
    await _firebaseAuth.currentUser!.updateDisplayName(name);
    await _firebaseAuth.currentUser!.reload();
    getUserDetail();
    notifyListeners();
    return null;
  }

  Future<void> getUserDetail() async {
    name = _firebaseAuth.currentUser!.displayName;
    email = _firebaseAuth.currentUser!.email;
    notifyListeners();
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
