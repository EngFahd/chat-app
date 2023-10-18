import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_10/Models/Massages.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> logIn({required String Email, required String Passwaord}) async {
    emit(LoginCubitLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Passwaord);
      emit(LoginCubitSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginCubitFailler(errorMessage: 'user-not-found'),);
      } else if (ex.code == 'wrong-password') {
        emit(LoginCubitFailler(errorMessage: 'wrong-password'),);
      }
    } catch (e) {
      emit(LoginCubitFailler(errorMessage: 'something went wrong'),);
    }
  }
Future<void> register(
      {required String Email, required String Passwaord}) async {
    emit(RegisterCubitLoading());
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Passwaord,
      );
      emit(RegisterCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterCubitFailler(errorMessage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          RegisterCubitFailler(
              errorMessage: 'The account already exists for that email. Try another email address'),
        );
      }
    } catch (e) {
      emit(RegisterCubitFailler(errorMessage: e.toString()));
    }
  }

}
