import 'package:blind_nav/presentation/auth/binding/auth_binding.dart';
import 'package:blind_nav/presentation/auth/view/auth_screen.dart';
import 'package:blind_nav/presentation/base/bindings/base_binding.dart';
import 'package:blind_nav/presentation/base/views/base_view.dart';
import 'package:blind_nav/presentation/history/bindings/history_binding.dart';
import 'package:blind_nav/presentation/history/views/history_view.dart';
import 'package:blind_nav/presentation/home/bindings/home_binding.dart';
import 'package:blind_nav/presentation/home/views/home_view.dart';
import 'package:blind_nav/presentation/settings/bindings/settings_binding.dart';
import 'package:blind_nav/presentation/settings/views/settings_view.dart';
import 'package:blind_nav/presentation/splash/bindings/splash_binding.dart';
import 'package:blind_nav/presentation/splash/views/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    // GetPage(
    //   name: _Paths.MY_ADS,
    //   page: () => const MyAdsView(),
    //   binding: MyAdsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.Chat,
    //   page: () => const ChatView(),
    //   binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NOTIFICATIONS,
    //   page: () => const NotificationsView(),
    //   binding: NotificationsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SEARCH,
    //   page: () => const SearchView(),
    //   binding: SearchBinding(),
    // ),
    // GetPage(
    //   name: _Paths.LOCATION,
    //   page: () => const LocationView(),
    //   binding: LocationBinding(),
    // ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    // GetPage(
    //   name: _Paths.PRODUCT_DETAILS,
    //   page: () => const ProductDetailsView(),
    //   binding: ProductDetailsBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
    // GetPage(
    //   name: _Paths.PRODUCT_DETAILS_EDIT,
    //   page: () => const ProductDetailsEditView(),
    //   binding: ProductDetailsEditBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
  ];
}
