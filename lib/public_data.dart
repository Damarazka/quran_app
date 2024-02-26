class PublicData {
  PublicData._privateConstructor();

  static final PublicData _instance = PublicData._privateConstructor();
  static PublicData get instance => _instance;

  String _message = 'no read yet';

  String get message => _message;

  set message(String value){
    _message = value;
  }

  String _ayat = '00';

  String get ayat => _ayat;

  set ayat(String value){
    _ayat = value;
  }
}
