import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginUtils {
  static const String tag = "LoginGoogleUtils";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User> signInWithGoogle() async {
    log("$tag, SignInWithGoogle() init...");
  }
}
