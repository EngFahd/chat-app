import 'package:chat_app/core/funcations.dart';
import 'package:chat_app/screen/chat_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key, this.email, this.password});
  static const String id = '/register';
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
                    "Register",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            CustomTextField(
              obscureText: false,
              onChanged: (valu) {
                email = valu;
              },
              lableText: "Email",
            ),
            CustomTextField(
              obscureText: false,
              onChanged: (data) {
                password = data;
              },
              lableText: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLogin(
              content: "Register",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  try {
                    FirebaseFunctions()
                        .createUser(email: email, password: password);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("Created account Success")));
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushNamed(context, ChatView.id,
                          arguments: email);
                    });
                  } on Exception catch (e) {
                    throw ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Text("some error hapen")));
                  }
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "You have un account ..? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text("Login",
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
