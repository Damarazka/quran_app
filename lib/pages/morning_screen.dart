import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/morning_model.dart';
import 'package:quran_app/viewModel/morningviewmodel.dart';

class MorningDzikr extends StatelessWidget {
  static const routeName = 'morning_dzikr';
  const MorningDzikr({super.key});

  @override
  Widget build(BuildContext context) {
    final MorningViewModel _viewModel = MorningViewModel();
    return Scaffold(
      body: FutureBuilder<List<Morning>>(
          future: _viewModel.getListMorning(),
          builder: (context, snapsot) {
            if (!snapsot.hasData) {
              return const Center(
                child: Text("tak ada data"),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) => _itemList(
                    context: context, morning: snapsot.data!.elementAt(index)),
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(0.1),
                      height: 1,
                    ),
                itemCount: snapsot.data!.length);
          }),
    );
  }

  Widget _itemList({required BuildContext context, required Morning morning}) =>
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    morning.title.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    morning.arabic.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    morning.translation.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    morning.fawaid.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    morning.source.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  )
                ],
              ))
            ],
          ),
        ),
      );
}
