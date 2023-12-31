import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  MySharedPref._();

  static late SharedPreferences _sharedPreferences;

  static const String _caneId = 'cane_id';
  static const String _urduKey = 'is_lang_urdu';
  static const String _myLocation = 'my_location';
  static const String _caneLocation = 'cane_location';

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  static Future<void> setCaneId(String caneId) =>
      _sharedPreferences.setString(_caneId, caneId);

  static String getCaneId() => _sharedPreferences.getString(_caneId) ?? '';

  static Future<void> setIsUrdu(bool isUrdu) =>
      _sharedPreferences.setBool(_urduKey, isUrdu);

  static bool getIsUrdu() => _sharedPreferences.getBool(_urduKey) ?? false;

  static Future<void> setMyLocation(String value) async =>
      await _sharedPreferences.setString(_myLocation, value);

  static String? getMyLocation() =>
      _sharedPreferences.getString(_myLocation) ?? 'my location';

  static Future<void> setCaneLocation(String value) async =>
      await _sharedPreferences.setString(_caneLocation, value);

  static String? getCaneLocation() =>
      _sharedPreferences.getString(_caneLocation) ?? 'cane location';

  static Future<void> clear() async => await _sharedPreferences.clear();
}
