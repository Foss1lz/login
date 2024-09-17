import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/screen/index.dart';
import 'package:test/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userEmailKey = 'user_email';
  static const String userNameKey = 'user_name';

  static Future<bool> getUserLoggedInSharedPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ??
        false; // Defaults to false if not set
  }

  static Future<void> setUserLoggedInSharedPreference(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, value);
  }

  static Future<void> setUserEmailSharedPreference(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userEmailKey, email);
  }

  static Future<void> setUserNameSharedPreference(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userNameKey, name);
  }
}

class AuthService {
  Future<void> signup({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Use Navigator without delay if no additional setup is needed
      await Helper.setUserEmailSharedPreference(email);
      await _updateUserProfile(name);
      await _saveUserDetails(name, email);
      await Helper.setUserNameSharedPreference(name);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Indexstack(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
    }
  }

  Future<void> _updateUserProfile(String name) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // ignore: deprecated_member_use
        await user.updateProfile(displayName: name);
        await user.reload();
        user = FirebaseAuth.instance.currentUser; // Refresh user data
      }
    } catch (e) {
      print("Error updating user profile: $e");
      _showToast('Error updating user profile');
    }
  }

  Future<void> _saveUserDetails(String name, String email) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': user.email,
          'name': name,
          // Add other fields if needed
        });
      }
    } catch (e) {
      print("Error saving user details: $e");
      _showToast('Error saving user details');
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Helper.setUserLoggedInSharedPreference(true);
      await Helper.setUserEmailSharedPreference(email);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Indexstack(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
    }
  }

  Future<void> signout({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      await Helper.setUserLoggedInSharedPreference(false);
      await Helper.setUserEmailSharedPreference("");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const login(),
        ),
      );
    } catch (e) {
      _showToast('Error signing out. Please try again.');
    }
    Future<void> saveUserDetails(String username) async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Save additional information in Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'email': user.email,
            'username': username,
            // Add other fields here
          });
        }
      } catch (e) {
        print("Error saving user details: $e");
        _showToast('Error saving user details');
      }
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
