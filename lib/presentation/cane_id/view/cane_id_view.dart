import 'package:blind_nav/presentation/cane_id/controller/cane_id_controller.dart';
import 'package:blind_nav/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CaneIdView extends GetView<CaneIdController> {
  const CaneIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaneIdController>(
      init: CaneIdController(),
      id: 'CaneId',
      builder: (_) {
        return Scaffold(
          body: Container(
              height: 150.h,
              width: 300.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                  child: ListTile(
                      // title: Text('Welcome'),
                      subtitle: TextField(
                        onChanged: (value) =>
                            controller.caneId = int.parse(value),
                        decoration: const InputDecoration(
                          hintText: 'Enter the Cane Id',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: controller.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  controller.toggleLoading();
                                  if (controller.caneId != 0) {
                                    FocusScope.of(context).unfocus();
                                    Get.offNamed(Routes.BASE);
                                  } else {
                                    controller.toggleLoading();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter the Cane Id'),
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )),
                      )))),
        );
      },
    );
  }
}
