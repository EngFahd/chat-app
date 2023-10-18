import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/Constant.dart';
import 'package:flutter_application_10/MyWidgites/ButtonLogIn.dart';
import 'package:flutter_application_10/MyWidgites/TextFiledWidgit.dart';
import 'package:flutter_application_10/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_10/cubit/chat_cubit/cubit/chat_p_cubit.dart';
import 'package:flutter_application_10/viwe/ChatPage.dart';
// import 'package:flutter_application_10/viwe/ChatePage.dart';
import 'package:flutter_application_10/viwe/Registeration.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sign_Screen extends StatelessWidget {
  // const Sign_Screen({super.key});
  static String id = 'SignScreen';

  @override
  GlobalKey<FormState> globalKey = GlobalKey();

  String? MyEmail, myPassword;
  bool isLoading = false;
  Widget build(BuildContext context) {
    // prefer than using lisener because build context best here
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginCubitLoading) {
          isLoading = true;
        } else if (state is LoginCubitSuccess) {
          scnackBar(context, 'Success');
          isLoading = false;
          BlocProvider.of<ChatPCubit>(context).showMassage();
          Navigator.pushNamed(context, ChatPage.id, arguments: MyEmail);
        } else if (state is LoginCubitFailler) {
          isLoading = false;
          scnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: globalKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      "assets/images/scholar.png",
                      // fit: BoxFit.cover,
                      height: 100,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Scholar Chat',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontFamily: 'pacifico'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFiledWidgit(
                        OnChange: (valu) {
                          MyEmail = valu;
                        },
                        hint: 'Email'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFiledWidgit(
                        ObscureText: true,
                        OnChange: (valu) {
                          myPassword = valu;
                        },
                        hint: 'Password'),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonLogin(
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
                            await BlocProvider.of<AuthCubit>(context)
                                .logIn(Email: MyEmail!, Passwaord: myPassword!);
                          }
                        },
                        title: 'LOGIN'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "dont/' have Account ? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: const Text(
                            "Register ",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> logIn() async {
    var creden = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: MyEmail!, password: myPassword!);
  }
}

void scnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.grey,
    ),
  );
}
