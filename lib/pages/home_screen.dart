import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/component/tab_item.dart';
import 'package:quran_app/pages/tabs/dzikr.dart';
import 'package:quran_app/pages/tabs/doa.dart';
import 'package:quran_app/pages/tabs/surah_tab.dart';
import 'package:quran_app/public_data.dart';
import 'package:quran_app/theme.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  String lastRead = PublicData.instance.message;

  String lastAyat = PublicData.instance.ayat;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.lastRead = PublicData.instance.message;
    });
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {
                setState(() {
                  widget.lastRead = PublicData.instance.message;
                });
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: _body(widget.lastRead, widget.lastAyat),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

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
        // ignore: deprecated_member_use
        icon: SvgPicture.asset(icon, color: secondary),
        activeIcon: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: primary,
        ),
        label: label);

DefaultTabController _body(String lastRead, String lastAyat) =>
    DefaultTabController(
        length: 3,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: _salam(lastRead, lastAyat),
                ),
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  shape: Border(
                      bottom: BorderSide(
                          width: 3, color: Colors.grey.withOpacity(0.1))),
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0),
                      child: TabBar(
                        labelColor: primary,
                        indicatorColor: primary,
                        indicatorWeight: 3,
                        tabs: [
                          itemTab(label: "Surah"),
                          itemTab(label: "Dzikr"),
                          itemTab(label: "Doa"),
                        ],
                      )),
                )
              ],
              body: const TabBarView(
                  children: [TabSurah(), TabDzikr(), TabDoa()]),
            )));

Column _salam(String lastRead, String lastAyat) => Column(
      children: [
        Text(
          "Assalamualaikum",
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: secondary),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Azka',
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffdf98fa), Color(0xff9055ff)])),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/quran_banner.svg')),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/book.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Last Read",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    lastRead,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Text(
                    lastAyat,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
