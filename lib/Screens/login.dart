import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Screens/create_account.dart';

import '../Custom-Widget/custom_input.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    bool savePassword = false;
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,

        body: Container(
          margin:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LeadingIconButtton(),
              Text(
                "Login Account",
                style: GoogleFonts.rubik(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Please login with registerd account.",
                style: GoogleFonts.suezOne(
                    fontSize: 14, color: Colors.black12, wordSpacing: 4),
              ),
              const SizedBox(
                height: 20,
              ),
              form(),
              Flexible(child: Container()),
              Row(
                children: [
                  Checkbox(
                      value: savePassword,
                      onChanged: (value) {
                        setState(() {
                          savePassword = value!;
                        });
                      }),
                  Text(
                    "save password",
                    style: GoogleFonts.suezOne(
                      color: Colors.black12,
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Flexible(child: Container()),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateAccount()));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.suezOne(
                          fontSize: 12,
                          color: color2,
                        ),
                      ))
                ],
              ),
              loginButton(),
              createLink(context)
            ],
          ),
        ),
      ),
    );
  }

  Row createLink(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You didn't have an account? ",
                  style: GoogleFonts.suezOne(
                      color: Colors.black26,
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      wordSpacing: 4),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateAccount()));
                    },
                    child: Text(
                      "create account",
                      style: GoogleFonts.suezOne(
                        fontSize: 14,
                        color: color2,
                      ),
                    ))
              ],
            );
  }

  Container loginButton() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration:
          BoxDecoration(color: color2, borderRadius: BorderRadius.circular(16)),
      child: TextButton(
        child: Text(
          "Login Account",
          style: GoogleFonts.suezOne(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        onPressed: () {},
      ),
    );
  }

  Form form() {
    return Form(
        child: Column(
      children: const [
        CustomInput(text: "Username", prefixIcon: Icon(FontAwesomeIcons.user)),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
        CustomInput(text: "Password", prefixIcon: Icon(FontAwesomeIcons.lock)),
      ],
    ));
  }
}
