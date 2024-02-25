import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/daily_model.dart';
import 'package:quran_app/viewModel/dailyviewmodel.dart';

class TabDoa extends StatelessWidget {
  const TabDoa({super.key});

  @override
  Widget build(BuildContext context) {
    final DailyViewModel _viewModel = DailyViewModel();
    return FutureBuilder<List<DailyDoa>>(
        future: _viewModel.getListDaily(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("ra ono data sam"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, dailyDoa: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList(
          {required BuildContext context, required DailyDoa dailyDoa}) =>
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
                    dailyDoa.title.toString(),
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
                    dailyDoa.arabic.toString(),
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
                    dailyDoa.translation.toString(),
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
                    dailyDoa.fawaid.toString(),
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
                    dailyDoa.source.toString(),
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
