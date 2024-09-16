import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String userName = FirebaseDatabase.instance.ref().child('user') as String;

  double _opacity = 1.0;
  void onTapDown(TapDownDetails details) {
    setState(() {
      _opacity = 0.5; // Adjust the opacity to your desired faded level
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _opacity = 1.0; // Reset opacity
    });
  }

  void _onTapCancel() {
    setState(() {
      _opacity = 1.0; // Reset opacity if the tap is canceled
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 242, 212),
      appBar: AppBar(
        leading: Text(''),
        title: Text(
          "Setting",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 242, 212),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTapDown: onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            onTap: () {
              print("Tapped");
            },
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(
                  milliseconds: 200), // Duration of the fade effect
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(125, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                height: 160,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    ClipOval(
                      child: Image.asset(
                        "assets/image/vatey.JPG",
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName.toString(),
                            style: GoogleFonts.quicksand(
                                color: const Color.fromARGB(255, 26, 50, 34),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            userEmail?.split('@')[0] ?? "Loading...",
                            style: GoogleFonts.quicksand(
                                color: const Color.fromARGB(255, 26, 50, 34),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
