import 'package:flutter/material.dart';
import 'package:test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/screen/index.dart';
import 'package:test/screen/login.dart';
import 'package:test/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  bool isLoggedIn = await Helper.getUserLoggedInSharedPreference();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const Indexstack() : const login(),
    );
  }
}
