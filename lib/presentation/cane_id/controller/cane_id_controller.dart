import 'package:get/get.dart';

class CaneIdController extends GetxController {
  bool isLoading = false;
  int caneId = 0;

  @override
  void onInit() {
    isLoading = false;
    super.onInit();
  }

  void toggleLoading() {
    isLoading = !isLoading;
    update(['AuthType']);
  }
}
