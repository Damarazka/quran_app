import 'package:quran_app/model/ayat_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class AyahViewModel {
  final _repository = QuranRepository();
  Future<AyahModel> getListAyah(String id) async {
    try {
      final response = await _repository.getListAyah(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
