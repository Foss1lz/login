import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screen/home.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:test/screen/setting.dart';

class Indexstack extends StatefulWidget {
  const Indexstack({super.key});

  @override
  State<Indexstack> createState() => _IndexstackState();
}

class _IndexstackState extends State<Indexstack> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Home(),
          Home(),
          Setting(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height *
                0.0, // Adjusts padding based on screen height
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 255, 242, 212),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.amber,
                icon: Icon(HugeIcons.strokeRoundedVideoReplay),
                label: 'Stories',
              ),
              BottomNavigationBarItem(
                icon: Icon(HugeIcons.strokeRoundedChatting01),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                  icon: Icon(HugeIcons.strokeRoundedSettings01),
                  label: "Setting"),
            ],
            currentIndex: _selectedIndex, // Set to state variable
            onTap: _onItemTapped,
            selectedItemColor: const Color.fromARGB(255, 26, 50, 34),
            selectedLabelStyle:
                GoogleFonts.quicksand(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            elevation: 00,
          ),
        ),
      ),
    );
  }
}
