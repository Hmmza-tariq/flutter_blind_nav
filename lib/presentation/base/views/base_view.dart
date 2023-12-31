import 'package:blind_nav/config/assets_manager.dart';
import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/my_shared_pref.dart';
import 'package:blind_nav/presentation/history/views/history_view.dart';
import 'package:blind_nav/presentation/home/views/home_view.dart';
import 'package:blind_nav/presentation/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: BaseController.caneId != ''
              ? IndexedStack(
                  index: controller.currentIndex,
                  children: const [
                    HomeView(),
                    HistoryView(),
                    // AddItemView(),
                    // MyAdsView(),
                    SettingsView()
                  ],
                )
              : Center(
                  child: Container(
                      height: 150.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                          child: ListTile(
                              subtitle: TextField(
                                style: const TextStyle(color: Colors.white),
                                onChanged: (value) =>
                                    BaseController.caneId = value,
                                decoration: const InputDecoration(
                                  hintText: 'Enter the Cane Id',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              trailing: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {
                                      if (BaseController.caneId != '') {
                                        MySharedPref.setCaneId(
                                            BaseController.caneId);
                                        controller.toggleIdAdded();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Please enter the Cane Id'),
                                          ),
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              )))),
                ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              backgroundColor: theme.scaffoldBackgroundColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0.0,
              items: [
                _mBottomNavItem(
                  label: Provider.of<StringsManager>(context).home,
                  icon: AssetsManager.homeIcon,
                ),
                _mBottomNavItem(
                  label: Provider.of<StringsManager>(context).history,
                  icon: AssetsManager.historyIcon,
                ),
                // _mBottomNavItem(
                //   label: Provider.of<StringsManager>(context).add,
                //   icon: AssetsManager.addIcon,
                // ),
                // _mBottomNavItem(
                //   label: Provider.of<StringsManager>(context).myAds,
                //   icon: AssetsManager.myAdsIcon,
                // ),
                // _mBottomNavItem(
                //   label: 'Notifications',
                //   icon: Constants.notificationsIcon,
                // ),
                _mBottomNavItem(
                  label: Provider.of<StringsManager>(context).settings,
                  icon: AssetsManager.settingsIcon,
                ),
              ],
              onTap: controller.changeScreen,
            ),
          ),
        ),
      ),
    );
  }

  _mBottomNavItem({required String label, required String icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        icon,
        theme: SvgTheme(currentColor: Get.theme.iconTheme.color!),
      ),
      activeIcon: SvgPicture.asset(icon,
          colorFilter:
              ColorFilter.mode(Get.theme.primaryColor, BlendMode.srcIn)),
    );
  }
}
