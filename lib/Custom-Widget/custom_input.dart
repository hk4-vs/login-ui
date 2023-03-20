
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatelessWidget {
  final String text;
  final Widget prefixIcon;

  const CustomInput({super.key, required this.text, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.suezOne(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              filled: true,
              fillColor: Colors.black12.withOpacity(0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )),
        ),
      ],
    );
  }
}
