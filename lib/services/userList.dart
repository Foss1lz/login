import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Declare the name variable globally
String? globalName;

class UserDataProvider extends StatelessWidget {
  final Widget child;

  const UserDataProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final users = snapshot.data!.docs;

        // Assuming you want to update globalName with the first user's name
        if (users.isNotEmpty) {
          globalName = users[0]['name'];
        }

        return child;
      },
    );
  }
}
