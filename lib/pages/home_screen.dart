import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/theme.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }
}

AppBar _appBar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svg/menu_icon.svg'),
      ),
      title: Text(
        'Quran App',
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: primary),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/search_icon.svg'))
      ],
    );
