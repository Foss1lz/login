import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screen/SignUpWidget.dart';
import 'package:test/screen/SignInWidget.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  //final AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        ColorFiltered(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
          child: Image.network(
            "https://i.pinimg.com/originals/71/55/76/7155762bf654836daa3d7ebaa235a1d1.jpg",
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
                  ],
                ),
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        showSignUp(context);
                      },
                      style: ButtonStyle(
                        shape: const WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.only(topRight: Radius.circular(0)),
                          ),
                        ),
                        overlayColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 95, 88, 72)
                                .withOpacity(0.3)),
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 255, 242, 212)),
                      ),
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.quicksand(
                            color: const Color.fromARGB(255, 26, 50, 34),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    color: Colors.red,
                    width: MediaQuery.of(context).size.height * 0.00020 //0.070,
                    ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        showSignIn(context);
                      },
                      style: ButtonStyle(
                        shape: const WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(0)),
                          ),
                        ),
                        overlayColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 95, 88, 72)
                                .withOpacity(0.3)),
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 255, 242, 212)),
                      ),
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.quicksand(
                            color: const Color.fromARGB(255, 26, 50, 34),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
