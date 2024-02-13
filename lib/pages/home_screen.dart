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
      body: Container(),
      bottomNavigationBar: _bottomNavigationBar(),
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

BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        _bottomNavigationBarItem(
            icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
        _bottomNavigationBarItem(icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
        _bottomNavigationBarItem(
            icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark'),
      ],
    );

BottomNavigationBarItem _bottomNavigationBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
        icon: SvgPicture.asset(icon, color: secondary),
        activeIcon: SvgPicture.asset(
          icon,
          color: primary,
        ),
        label: label);
