import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabDzikr extends StatelessWidget {
  const TabDzikr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffdf98fa), Color(0xff9055ff)])),
          child: Text(
            "Morning Dzikr",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffdf98fa), Color(0xff9055ff)])),
          child: Text("Evening Dzikr",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 16)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffdf98fa), Color(0xff9055ff)])),
          child: Text("Dzikr After Shalat",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 16)),
        )
      ],
    );
  }
}
