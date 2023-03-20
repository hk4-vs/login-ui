import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Screens/create_account.dart';

import 'package:login_ui/main.dart';

class IntroManage extends StatelessWidget {
  const IntroManage({super.key});

  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).size.height * 0.3;
    // log("size log: $size");
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [color1.withOpacity(0.8), color3],
              begin: Alignment.topCenter,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageWidget(),
                bodyText(context),
                Flexible(child: Container()),
                nextButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container nextButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 200,
      height: 60,
      decoration:
          BoxDecoration(color: color2, borderRadius: BorderRadius.circular(8)),
      child: TextButton(
        child: Text(
          "Next",
          style: GoogleFonts.suezOne(color: Colors.white, fontSize: 14),
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateAccount())),
      ),
    );
  }

  SizedBox bodyText(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Text(
            "Manage Your Work",
            style: GoogleFonts.suezOne(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Incomplete your productivity by imporving your personal tasks.",
            style: GoogleFonts.suezOne(fontSize: 14, color: Colors.black12),
          )
        ],
      ),
    );
  }

  Container imageWidget() {
    return Container(
      padding: const EdgeInsets.all(40),
      // height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [color1, color1.withOpacity(0.6)],
          ),
          shape: BoxShape.circle),
      child: Container(
        padding: const EdgeInsets.all(40),
        // height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [color1, color1.withOpacity(0.6)],
            ),
            shape: BoxShape.circle),
        child: Container(
          padding: const EdgeInsets.all(40),
          // height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [color1, color1.withOpacity(0.3)],
              ),
              shape: BoxShape.circle),
          child: Container(
            height: 260,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage("assets/illstrator-1.png"))),
          ),
        ),
      ),
    );
  }
}
