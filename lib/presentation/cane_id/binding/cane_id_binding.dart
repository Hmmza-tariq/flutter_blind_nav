import 'package:blind_nav/presentation/cane_id/controller/cane_id_controller.dart';
import 'package:get/get.dart';

class CaneIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaneIdController>(
      () => CaneIdController(),
    );
  }
}
