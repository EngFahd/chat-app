// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA2ruLObAOpFxW9iKCltxXTVYemmWIpW9w',
    appId: '1:1024470157538:web:be709d93d0c750cb81b6bb',
    messagingSenderId: '1024470157538',
    projectId: 'chat-app-e4f3d',
    authDomain: 'chat-app-e4f3d.firebaseapp.com',
    storageBucket: 'chat-app-e4f3d.appspot.com',
    measurementId: 'G-5D4SLTRGEZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDutLZ6JTIbg6N9SjItCT6ABeMEBsQS2BU',
    appId: '1:1024470157538:android:cddc51ff5107285c81b6bb',
    messagingSenderId: '1024470157538',
    projectId: 'chat-app-e4f3d',
    storageBucket: 'chat-app-e4f3d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUcRnwFUFYtQFs8cBNJT_SGmgcik-J1Zk',
    appId: '1:1024470157538:ios:935dae038306751881b6bb',
    messagingSenderId: '1024470157538',
    projectId: 'chat-app-e4f3d',
    storageBucket: 'chat-app-e4f3d.appspot.com',
    iosBundleId: 'com.example.flutterApplication10',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUcRnwFUFYtQFs8cBNJT_SGmgcik-J1Zk',
    appId: '1:1024470157538:ios:a5b9ddd419fa424b81b6bb',
    messagingSenderId: '1024470157538',
    projectId: 'chat-app-e4f3d',
    storageBucket: 'chat-app-e4f3d.appspot.com',
    iosBundleId: 'com.example.flutterApplication10.RunnerTests',
  );
}
