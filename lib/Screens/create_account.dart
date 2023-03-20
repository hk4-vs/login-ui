import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Custom-Widget/custom_input.dart';
import 'package:login_ui/Screens/login.dart';
import 'package:login_ui/Screens/verification_page.dart';
import 'package:login_ui/main.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Create Account",
                style: GoogleFonts.rubik(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Managing your basic to create an account.",
                style: GoogleFonts.suezOne(
                    fontSize: 14, color: Colors.black12, wordSpacing: 4),
              ),
              const SizedBox(
                height: 20,
              ),
              form(),
              Flexible(child: Container()),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: color2, borderRadius: BorderRadius.circular(16)),
                child: TextButton(
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.suezOne(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VerificationPage())),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
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
                                builder: (context) => const LoginPage()));
                      },
                      child: Text(
                        "login",
                        style: GoogleFonts.suezOne(
                          fontSize: 14,
                          color: color2,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
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
        CustomInput(
            text: "Email or Phone Number",
            prefixIcon: Icon(FontAwesomeIcons.phone)),
        SizedBox(
          height: 10,
        ),
        CustomInput(text: "Password", prefixIcon: Icon(FontAwesomeIcons.lock)),
      ],
    ));
  }
}

class LeadingIconButtton extends StatelessWidget {
  const LeadingIconButtton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          // color: Color(0xffFAFAFA),
          shape: BoxShape.circle,
          color: color1),
      child: IconButton(
        icon: const Icon(FontAwesomeIcons.chevronLeft),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
