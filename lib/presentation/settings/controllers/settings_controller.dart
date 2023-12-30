import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SettingsController extends GetxController {
  var isUrdu = MySharedPref.getIsUrdu();

  void changeLanguage(bool value) {
    Provider.of<StringsManager>(Get.context!, listen: false).toggleLanguage();
    MySharedPref.setIsUrdu(!isUrdu);
    isUrdu = MySharedPref.getIsUrdu();
    update(['Language']);
  }
}
