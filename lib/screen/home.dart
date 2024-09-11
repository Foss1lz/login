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
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Color.fromARGB(255, 255, 242, 212),
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
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 80,
                    //color: const Color.fromARGB(255, 54, 244, 133),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: SizedBox(
                            height: 65,
                            width: 65,
                            child: Image.asset(
                              "assets/image/vatey.JPG",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tey tey",
                                style: GoogleFonts.quicksand(
                                    color:
                                        const Color.fromARGB(255, 26, 50, 34),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Hello",
                                style: GoogleFonts.quicksand(
                                    color:
                                        const Color.fromARGB(255, 26, 50, 34),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
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
