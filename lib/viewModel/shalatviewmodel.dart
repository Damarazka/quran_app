import 'package:quran_app/model/shalat_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class ShalatViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<Shalat>> getListShalat() async =>
      await _repository.getListShalat();
}
