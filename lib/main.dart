import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screen/chat_view.dart';
import 'package:chat_app/screen/login_view.dart';
import 'package:chat_app/screen/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:chat/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        ChatView.id: (context) => ChatView()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.id,
    );
  }
}
