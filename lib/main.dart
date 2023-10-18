import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_10/cubit/chat_cubit/cubit/chat_p_cubit.dart';
import 'package:flutter_application_10/firebase_options.dart';
import 'package:flutter_application_10/viwe/ChatPage.dart';
// import 'package:flutter_application_10/viwe/ChatePage.dart';
import 'package:flutter_application_10/viwe/Registeration.dart';
import 'package:flutter_application_10/viwe/SignInScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ChatPCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          Sign_Screen.id: (context) => Sign_Screen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatPage.id: (context) => ChatPage()
        },
        debugShowCheckedModeBanner: false,
        initialRoute: Sign_Screen.id,
      ),
    );
  }
}
