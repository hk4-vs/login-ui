import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Screens/login.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../main.dart';
import 'create_account.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  List<TextInputFormatter> numberInputFormatter = <TextInputFormatter>[
    // for below version 2 use this
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    // for version 2 and greater youcan also use this
    FilteringTextInputFormatter.digitsOnly
  ];
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            height: MediaQuery.of(context).size.height - 80,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LeadingIconButtton(),
                Text(
                  "Verification",
                  style: GoogleFonts.rubik(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Please check your phone number or email",
                  style: GoogleFonts.suezOne(
                      fontSize: 14, color: Colors.black12, wordSpacing: 4),
                ),
                const SizedBox(
                  height: 20,
                ),
                centerIconWidget(context),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: OTPTextField(
                      controller: otpController,
                      length: 4,
                      width: double.infinity,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      inputFormatter: numberInputFormatter,
                      fieldWidth: 45,
                      otpFieldStyle: OtpFieldStyle(
                          backgroundColor: const Color.fromARGB(14, 0, 0, 0)),
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 4,
                      style: const TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        log("Changed: $pin");
                      },
                      onCompleted: (pin) {
                        log("Completed: $pin");
                      }),
                ),
                Flexible(child: Container()),
                submitButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You didn't recived the code? ",
                      style: GoogleFonts.suezOne(
                          color: Colors.black26,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          wordSpacing: 4),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "resend",
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
      ),
    );
  }

  Column centerIconWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color.fromARGB(14, 0, 0, 0)),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [color1, color2])),
            child: const Icon(
              Icons.mail_lock,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              Text(
                "Verification Code",
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "We have to sent verification code to +917415752664",
                textAlign: TextAlign.center,
                style: GoogleFonts.suezOne(
                    color: Colors.black12,
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    wordSpacing: 4),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container submitButton() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration:
          BoxDecoration(color: color2, borderRadius: BorderRadius.circular(16)),
      child: TextButton(
        child: Text(
          "Submit",
          style: GoogleFonts.suezOne(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        onPressed: () {
          onSubmitmodal(context);
        },
      ),
    );
  }

  onSubmitmodal(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: modalIcon(),
            title: Text(
              "Register Success",
              style:
                  GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Congratulation!\nYour account successfully created.",
              style: GoogleFonts.rubik(fontSize: 14, color: Colors.black12),
              textAlign: TextAlign.center,
            ),
            actions: [
              Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                decoration: BoxDecoration(
                    color: color2, borderRadius: BorderRadius.circular(16)),
                child: TextButton(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.suezOne(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => route.isFirst);
                  },
                ),
              )
            ],
          );
        });
  }

  Container modalIcon() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Color.fromARGB(14, 0, 0, 0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [color1, color2])),
        child: const Icon(
          Icons.done_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
