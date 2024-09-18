import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:test/services/auth_service.dart';
import 'package:test/services/userList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        shadowColor: Colors.black,
        title: Text(
          "Chats",
          style: GoogleFonts.quicksand(
              color: const Color.fromARGB(255, 26, 50, 34),
              fontSize: 16,
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
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                right: 15.0, left: 8.0, top: 8.0, bottom: 8.0),
            child: ClipOval(
              child: SizedBox(
                width: 40,
                height: 50,
                child: Image.asset(
                  "assets/image/background.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 179, 0),
        child: Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //   globalName = null;
                  AuthService().signout(context: context);
                },
                child: const Text("Signout")),
          ],
        )),
      ),
      body: Column(
        children: [
          const Padding(
            // textfield
            padding: EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(color: Color.fromARGB(255, 26, 50, 34)),
              cursorColor: Color.fromARGB(255, 26, 50, 34),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  HugeIcons.strokeRoundedSearch01, //icon
                  color: Color.fromARGB(255, 26, 50, 34),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 26, 50, 34),
                      width: 2), // Border when focused
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Search',
                labelStyle: TextStyle(color: Color.fromARGB(255, 26, 50, 34)),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTapDown: onTapDown,
                    onTapUp: _onTapUp,
                    onTapCancel: _onTapCancel,
                    onTap: () {
                      print("tapped");
                    },
                    child: AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(
                          milliseconds: 200), // Duration of the fade effect

                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        height: 80,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  "assets/image/vatey.JPG",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tey tey",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.quicksand(
                                        color: const Color.fromARGB(
                                            255, 26, 50, 34),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "Heldddddddddddddddddddddddddddddddddddddddddddddlo",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: GoogleFonts.quicksand(
                                          color: const Color.fromARGB(
                                              255, 26, 50, 34),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                bottom: 28,
                                right: 20,
                              ),
                              child: Text(
                                "03:05AM",
                                overflow: TextOverflow.visible,
                                maxLines: 1,
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w800,
                                  color: const Color.fromARGB(255, 61, 118, 80),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
