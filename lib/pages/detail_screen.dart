import 'package:flutter/material.dart';
import 'package:quran_app/model/ayat_model.dart';
import 'package:quran_app/viewModel/ayahviewmodel.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final AyahViewModel _viewModel = AyahViewModel();
    return Scaffold(
      body: FutureBuilder(
          future: _viewModel.getListAyah(id),
          builder: (context, AsyncSnapshot<AyahModel> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }else if (snapshot.hasError){
              return Center(child: Text('Error : ${snapshot.error}'),);
            }else if (snapshot.hasData){
              return Center(
                child: Text(snapshot.data!.deskripsi.toString()),);
            }else{
              return const Center(
                child: Text("data not avalabel"),
              );
            }
          },
    ));
  }
}
