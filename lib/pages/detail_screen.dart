import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/ayat_model.dart';
import 'package:quran_app/pages/home_screen.dart';
import 'package:quran_app/public_data.dart';
import 'package:quran_app/viewModel/ayahviewmodel.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final AyahViewModel _viewModel = AyahViewModel();
    final assetsAudioPlayer = AssetsAudioPlayer();

    return FutureBuilder(
      future: _viewModel.getListAyah(id),
      builder: (context, AsyncSnapshot<AyahModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data!.namaLatin.toString()),
              actions: [
                IconButton(
                    onPressed: () {
                      assetsAudioPlayer.open(
                        Audio.network(snapshot.data!.audio.toString()),
                      );
                      assetsAudioPlayer.play();
                    },
                    icon: const Icon(Icons.volume_up_rounded)),
                IconButton(
                    onPressed: () {
                      assetsAudioPlayer.playOrPause();
                    },
                    icon: const Icon(Icons.stop_circle))
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                  assetsAudioPlayer.stop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: ListView.separated(
              itemBuilder: (context, index) => _itemList(
                context: context,
                ayahModel: snapshot.data!,
                ayat: snapshot.data!.ayat!.elementAt(index),
                assetsAudioPlayer: assetsAudioPlayer,
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.1),
                height: 1,
              ),
              itemCount: snapshot.data!.ayat!.length,
            ),
          );
        } else {
          return const Center(
            child: Text('Data tidak tersedia'),
          );
        }
      },
    );
  }

  Widget _itemList({
    required BuildContext context,
    required Ayat ayat,
    required AyahModel ayahModel,
    required AssetsAudioPlayer assetsAudioPlayer,
  }) =>
      InkWell(
        onLongPress: () {
          PublicData.instance.ayat = ayat.nomor.toString();
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/svg/nomor_surah.svg'),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Center(
                            child: Text(
                              ayat.nomor.toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      ayat.ar.toString(),
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    ayat.idn.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
