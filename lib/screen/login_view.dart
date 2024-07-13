import 'package:chat_app/core/funcations.dart';
import 'package:chat_app/screen/chat_view.dart';
import 'package:chat_app/screen/register_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  static const String id = '/loginPage';
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475e),
      body: Form(
        key: formKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 80),
            Image.asset(
              height: 200,
              'assets/images/scholar.png',
              scale: 0.5,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Scholar Chat",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    "Login",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            CustomTextField(
              obscureText: false,
              suffixIcon: const Icon(Icons.search),
              onChanged: (valu) {
                email = valu;
              },
              lableText: "Email",
            ),
            CustomTextField(
              obscureText: true,
              suffixIcon: const Icon(Icons.remove_red_eye),
              onChanged: (valu) {
                password = valu;
              },
              lableText: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLogin(
              content: "Login",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  FirebaseFunctions()
                      .signInUser(userEmail: email, userPassword: password);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text("Login Success")));

                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushNamed(context, ChatView.id, arguments: email);
                  });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "dont have un account ..? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, RegisterView.id),
                  child: const Text("register",
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
