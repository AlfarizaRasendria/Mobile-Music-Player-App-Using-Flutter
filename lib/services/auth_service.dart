import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:versyll/Models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  String tempToken = "";
  String token = "";
  String uid = "";

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

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
