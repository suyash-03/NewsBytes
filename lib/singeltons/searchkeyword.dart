class KeyData {
  static final KeyData _keyData = new KeyData._internal();

  String text;
  factory KeyData(){
    return _keyData;
  }

  KeyData._internal();
}
final keyData = KeyData();