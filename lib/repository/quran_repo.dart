import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/model/ayat_model.dart';
import 'package:quran_app/model/daily_model.dart';
import 'package:quran_app/model/evening_model.dart';
import 'package:quran_app/model/morning_model.dart';
import 'package:quran_app/model/shalat_model.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:http/http.dart' as http;

class QuranRepository {
  Future<List<Surah>> getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  Future<List<DailyDoa>> getListDaily() async {
    String data = await rootBundle.loadString('assets/data/daily-doa.json');
    return dailyFromJson(data);
  }

  Future<List<Morning>> getListMorning() async {
    String data = await rootBundle.loadString('assets/data/dzikr-morning.json');
    return morningFromJson(data);
  }

  Future<List<Evening>> getListEvening() async {
    String data = await rootBundle.loadString('assets/data/dzikr-evening.json');
    return eveningFromJson(data);
  }

  Future<List<Shalat>> getListShalat() async {
    String data = await rootBundle.loadString('assets/data/dzikr-after.json');
    return shalatFromJson(data);
  }

  Future<AyahModel> getListAyah(String id) async {
    String url = ("https://equran.id/api/surat/$id");

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return AyahModel.fromJson(body);
    }
    throw Exception("error");
  }
}
