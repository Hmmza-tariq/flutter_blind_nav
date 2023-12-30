import 'package:blind_nav/config/strings_manager.dart';
import 'package:intl/intl.dart';
import 'package:blind_nav/data/models/location_model.dart';
import 'package:blind_nav/presentation/widgets/no_data.dart';
import 'package:blind_nav/presentation/widgets/screen_title.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            ScreenTitle(
              title: Provider.of<StringsManager>(context).history,
              dividerEndIndent: 200,
            ),
            20.verticalSpace,
            GetBuilder<HistoryController>(
              builder: (_) => SizedBox(
                height: 550.h,
                child: FirebaseAnimatedList(
                  reverse: true,
                  query: controller.ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    DateTime dateTime = DateTime.parse(
                        snapshot.child('time').value!.toString());
                    DateFormat dateFormat = DateFormat('HH:mm , dd/MM/yy');
                    String formattedDate = dateFormat.format(dateTime);
                    return snapshot.child('latitude').value == null
                        ? NoData(
                            text: Provider.of<StringsManager>(context)
                                .noItemInFavourite)
                        : Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.theme.primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                              color: context.theme.colorScheme.surface,
                            ),
                            child: ListTile(
                                onTap: () => controller.openMaps(LocationModel(
                                    latitude: double.parse(snapshot
                                        .child('latitude')
                                        .value!
                                        .toString()),
                                    longitude: double.parse(snapshot
                                        .child('longitude')
                                        .value!
                                        .toString()),
                                    address: snapshot
                                        .child('address')
                                        .value!
                                        .toString())),
                                leading: Icon(
                                  Icons.location_on_outlined,
                                  color: context.theme.primaryColor,
                                ),
                                title: Text(
                                  snapshot.child('address').value!.toString(),
                                  style: context.theme.textTheme.bodyMedium,
                                ),
                                trailing: Icon(
                                  Icons.open_in_new,
                                  color: context.theme.primaryColor,
                                ),
                                subtitle: Text(
                                  formattedDate,
                                  //  "date ${snapshot.child('time').value!.toString()}",
                                  style: context.theme.textTheme.bodyMedium,
                                )),
                          );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
