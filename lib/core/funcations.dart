import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  createUser({required email, required password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return('The account already exists for that email.');
      }
    } catch (e) {
      return(e.toString());
    }
  }

  signInUser({required userEmail, required userPassword}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return('Wrong password provided for that user.');
      }
    }
  }
}
