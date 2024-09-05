import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        ColorFiltered(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          child: Image.network(
            "https://i.pinimg.com/originals/7b/39/18/7b391875a747ba004dde89e2cde75d2c.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                //    color: const Color.fromARGB(99, 139, 245, 171),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.99,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome!",
                      style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 203, 255, 229),
                          fontWeight: FontWeight.bold,
                          fontSize: 70),
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(left: 50, right: 50, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  overlayColor: WidgetStateProperty.all(
                                      const Color.fromARGB(255, 95, 88, 72)
                                          .withOpacity(0.3)),
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color.fromARGB(255, 255, 242, 212)),
                                ),
                                child: Text(
                                  "Sign up",
                                  style: GoogleFonts.quicksand(
                                      color:
                                          const Color.fromARGB(255, 26, 50, 34),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Loginsr()));
                                  showCustomBottomSheet(context);
                                },
                                style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  overlayColor: WidgetStateProperty.all(
                                      const Color.fromARGB(255, 95, 88, 72)
                                          .withOpacity(0.3)),
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color.fromARGB(255, 255, 242, 212)),
                                ),
                                child: Text(
                                  "Log in",
                                  style: GoogleFonts.quicksand(
                                      color:
                                          const Color.fromARGB(255, 26, 50, 34),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
