import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 242, 212),
        appBar: AppBar(
          title: Text(
            "Chats",
            style: GoogleFonts.quicksand(
                color: const Color.fromARGB(255, 26, 50, 34),
                fontSize: MediaQuery.of(context).size.height * 0.030,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 242, 212),
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(HugeIcons
                  .strokeRoundedMenu03), // Change this to your desired icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            );
          }),
        ),
        drawer: const Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Color.fromARGB(255, 255, 242, 212),
        ),
        body: Container());
  }
}
