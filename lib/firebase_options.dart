// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyC5HT4-_kDEoAzaLsdF_BxssRdUeSpMOFE',
    appId: '1:716362569955:web:3fd5635e235870852fcdd6',
    messagingSenderId: '716362569955',
    projectId: 'login-chatly',
    authDomain: 'login-chatly.firebaseapp.com',
    storageBucket: 'login-chatly.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtaKBV-w4HwbA_oQJtb3RU0rPVNlmYo9Y',
    appId: '1:716362569955:android:88f4c7d629cd5a052fcdd6',
    messagingSenderId: '716362569955',
    projectId: 'login-chatly',
    storageBucket: 'login-chatly.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5HT4-_kDEoAzaLsdF_BxssRdUeSpMOFE',
    appId: '1:716362569955:web:c4067676e57eb4912fcdd6',
    messagingSenderId: '716362569955',
    projectId: 'login-chatly',
    authDomain: 'login-chatly.firebaseapp.com',
    storageBucket: 'login-chatly.appspot.com',
  );
}
