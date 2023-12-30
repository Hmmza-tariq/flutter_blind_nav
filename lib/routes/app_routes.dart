// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const AUTH = _Paths.AUTH;
  static const PHONE = _Paths.PHONE;
  static const BASE = _Paths.BASE;
  static const HOME = _Paths.HOME;
  static const HISTORY = _Paths.HISTORY;
  static const MY_ADS = _Paths.MY_ADS;
  static const Chat = _Paths.Chat;
  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
  static const SEARCH = _Paths.SEARCH;
  static const LOCATION = _Paths.LOCATION;
  static const SETTINGS = _Paths.SETTINGS;
  static const PRODUCT_DETAILS = _Paths.PRODUCT_DETAILS;
  static const PRODUCT_DETAILS_EDIT = _Paths.PRODUCT_DETAILS_EDIT;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const AUTH = '/auth';
  static const PHONE = '/phone';
  static const BASE = '/base';
  static const HOME = '/home';
  static const HISTORY = '/history';
  static const MY_ADS = '/my-ads';
  static const Chat = '/Chat';
  static const NOTIFICATIONS = '/notifications';
  static const SEARCH = '/search';
  static const LOCATION = '/location';
  static const SETTINGS = '/settings';
  static const PRODUCT_DETAILS = '/product-details';
  static const PRODUCT_DETAILS_EDIT = '/product-details-edit';
}
