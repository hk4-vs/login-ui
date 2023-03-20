import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/Screens/intro_page.dart';
import 'package:login_ui/main.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Stack(children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color2,
            ),
            child: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const IntroManage())),
                icon: Icon(
                  FontAwesomeIcons.chevronRight,
                  color: color3,
                )),
          ),
        ]),
        body: Container(
            color: color1,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Center(
              child: Text(
                "Aaditya",
                style: GoogleFonts.suezOne(fontSize: 18, color: color4),
              ),
            )),
      ),
    );
  }
}
