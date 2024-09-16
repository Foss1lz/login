import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/screen/SignInWidget.dart';
import 'package:test/services/auth_service.dart';

class Signupwidget extends StatefulWidget {
  const Signupwidget({super.key});

  @override
  State<Signupwidget> createState() => _SignupwidgetState();
}

class _SignupwidgetState extends State<Signupwidget> {
  // Define the variable here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pass _obsuretext to the showCustomBottomSheet function
            showSignUp(context);
          },
          child: const Text("Show Bottom Sheet"),
        ),
      ),
    );
  }
}

void showSignUp(BuildContext context) {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  bool obsuretext = true;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.85, // Set height
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 207, 196, 170), // Add background color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.black,
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text('Chatly',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: const Color.fromARGB(255, 26, 50, 34),
                      )),
                  Text(
                    "Sign up",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromARGB(255, 54, 96, 66),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    //username textfield
                    padding: const EdgeInsets.only(
                        top: 40, left: 16.0, right: 16.0, bottom: 16.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 26, 50, 34)),
                      cursorColor: const Color.fromARGB(255, 26, 50, 34),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email, //icon
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
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 26, 50, 34)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        }
                        // Regular expression for email validation
                        final emailRegExp = RegExp(
                          r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                          caseSensitive: false,
                        );
                        if (!emailRegExp.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    //password textfield
                    padding: const EdgeInsets.all(16.0),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return TextFormField(
                          controller: passwordcontroller,
                          obscureText: obsuretext,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 26, 50, 34)),
                          cursorColor: const Color.fromARGB(255, 26, 50, 34),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock, //icon
                              color: Color.fromARGB(255, 26, 50, 34),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obsuretext
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(255, 26, 50, 34),
                              ),
                              onPressed: () {
                                setState(() {
                                  obsuretext = !obsuretext;
                                });
                              },
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 26, 50, 34),
                                  width: 2), // Border when focused
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 26, 50, 34)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            // Minimum 8 characters, at least one letter and one number
                            final passwordRegExp = RegExp(
                              r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
                            );
                            if (!passwordRegExp.hasMatch(value)) {
                              return 'Password must 8 characters or longer with letters and numbers';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    //confirmpassword textfield
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0, bottom: 5),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return TextFormField(
                          controller: confirmpasswordcontroller,
                          obscureText: obsuretext,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 26, 50, 34)),
                          cursorColor: const Color.fromARGB(255, 26, 50, 34),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock, //icon
                              color: Color.fromARGB(255, 26, 50, 34),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obsuretext
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(255, 26, 50, 34),
                              ),
                              onPressed: () {
                                setState(() {
                                  obsuretext = !obsuretext;
                                });
                              },
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 26, 50, 34),
                                  width: 2), // Border when focused
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 26, 50, 34)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passwordcontroller.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              margin: const EdgeInsets.only(right: 20, bottom: 20),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.40,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState?.validate() ?? false) {
                    await AuthService().signup(
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                        name: passwordcontroller.text,
                        context: context);
                  }
                },
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(10),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  overlayColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 95, 88, 72).withOpacity(0.3)),
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 231, 219, 189)),
                ),
                child: Text(
                  "Sign up",
                  style: GoogleFonts.quicksand(
                      color: const Color.fromARGB(255, 26, 50, 34),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 60),
              child: const Text("________________ or ________________"),
            ),
            Container(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.quicksand(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showSignIn(context);
                      },
                      child: SizedBox(
                        height: 20,
                        width: 70,
                        // color: Colors.amber,
                        child: Text(
                          "  Sign in",
                          style: GoogleFonts.quicksand(
                            color: const Color.fromARGB(255, 54, 96, 66),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      );
    },
  );
}
