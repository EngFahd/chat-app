import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/Constant.dart';
import 'package:flutter_application_10/MyWidgites/ButtonLogIn.dart';
import 'package:flutter_application_10/MyWidgites/TextFiledWidgit.dart';
import 'package:flutter_application_10/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_10/cubit/chat_cubit/cubit/chat_p_cubit.dart';
import 'package:flutter_application_10/viwe/ChatPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    super.key,
  });
  static String id = 'Register_Screen';
  //  to access all componts in widgit
  GlobalKey<FormState> globalKey = GlobalKey();

  String? Email, Password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterCubitLoading) {
          isLoading = true;
        } else if (state is RegisterCubitSuccess) {
          scnackBar(context, 'Success');
          isLoading = false;
          Navigator.pushNamed(context, ChatPage.id,arguments: Email);
          BlocProvider.of<ChatPCubit>(context).showMassage();
        } else if (state is RegisterCubitFailler) {
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
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      "assets/images/scholar.png",
                      height: 100,
                      // fit: BoxFit.cover,
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
                          'Register',
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
                        OnChange: (value) {
                          Email = value;
                        },
                        hint: 'Email'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFiledWidgit(
                        OnChange: (value) {
                          Password = value;
                        },
                        hint: 'Password'),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonLogin(
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
                            await BlocProvider.of<AuthCubit>(context)
                                .register(Email: Email!, Passwaord: Password!);
                          }
                        },
                        title: 'Register'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already have an account ! ",
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            " Login ",
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

  void scnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
