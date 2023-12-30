import 'package:blind_nav/presentation/history/controllers/history_controller.dart';
import 'package:blind_nav/presentation/home/controllers/home_controller.dart';
import 'package:blind_nav/presentation/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<ChatController>(() => ChatController());
    // Get.lazyPut<AddItemController>(() => AddItemController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
