import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/shalat_model.dart';
import 'package:quran_app/viewModel/shalatviewmodel.dart';

class AfterShalat extends StatelessWidget {
  static const routeName = 'after_shalat';
  const AfterShalat({super.key});

  @override
  Widget build(BuildContext context) {
    final ShalatViewModel _viewModel = ShalatViewModel();
    return Scaffold(
      appBar: AppBar(
        title: Title(
            color: Colors.blueAccent,
            child: Text(
              "After Shalat",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            )),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: FutureBuilder<List<Shalat>>(
          future: _viewModel.getListShalat(),
          builder: (context, snapsot) {
            if (!snapsot.hasData) {
              return const Center(
                child: Text("tak ada data"),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) => _itemList(
                    context: context, shalat: snapsot.data!.elementAt(index)),
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(0.1),
                      height: 1,
                    ),
                itemCount: snapsot.data!.length);
          }),
    );
  }

  Widget _itemList({required BuildContext context, required Shalat shalat}) =>
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
                    shalat.title.toString(),
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
                    shalat.arabic.toString(),
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
                    shalat.translation.toString(),
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
                    shalat.fawaid.toString(),
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
                    shalat.source.toString(),
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
