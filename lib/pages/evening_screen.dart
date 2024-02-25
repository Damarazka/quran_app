import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/evening_model.dart';
import 'package:quran_app/viewModel/eveningviewmodel.dart';

class EveningDzikr extends StatelessWidget {
  static const routeName = 'evening_dzikr';
  const EveningDzikr({super.key});

  @override
  Widget build(BuildContext context) {
    final EveningViewModel _viewModel = EveningViewModel();
    return Scaffold(
      body: FutureBuilder<List<Evening>>(
          future: _viewModel.getListEvening(),
          builder: (context, snapsot) {
            if (!snapsot.hasData) {
              return const Center(
                child: Text("tak ada data"),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) => _itemList(
                    context: context, evening: snapsot.data!.elementAt(index)),
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(0.1),
                      height: 1,
                    ),
                itemCount: snapsot.data!.length);
          }),
    );
  }

  Widget _itemList({required BuildContext context, required Evening evening}) =>
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
                    evening.title.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    evening.arabic.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    evening.translation.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    evening.fawaid.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Text(
                    evening.source.toString(),
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
