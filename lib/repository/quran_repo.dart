import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/model/ayat_model.dart';
import 'package:quran_app/model/surah_model.dart';

class QuranRepository{
  Future<List<Surah>> getListSurah() async{
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  Future<AyahModel> getListAyah(String id) async{
    var response = await Dio().get("https://equran.id/api/surat/$id");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.data);
      return AyahModel.fromJson(body);
    }
    throw Exception("error");
  }
}