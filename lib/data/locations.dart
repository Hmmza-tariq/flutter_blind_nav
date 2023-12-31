import 'package:blind_nav/data/models/location_model.dart';
import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/my_shared_pref.dart';
import 'package:blind_nav/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Locations {
  static late LocationModel myLocation;
  static late LocationModel caneLocation;

  Future<void> getLocations() async {
    await getMyLocation();
    await getCaneLocation();
  }

  Future<String?> getMyLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission Denied",
          "Please allow location permission from settings");
      await Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      String? address = await NetworkUtils().getAddressFromLatLng(
          position.latitude.toString(), position.longitude.toString());
      Locations.myLocation = LocationModel(
          latitude: position.latitude,
          longitude: position.longitude,
          address: address);
      debugPrint('my position: $position,address: $address');
      return address;
    }
    return null;
  }

  Future<String?> getCaneLocation() async {
    Locations.caneLocation = LocationModel(
        latitude: Locations.myLocation.latitude,
        longitude: Locations.myLocation.longitude,
        address: Locations.myLocation.address);
    debugPrint(
        '1- cane latitude: ${Locations.caneLocation.latitude},longitude: ${Locations.caneLocation.longitude} address: ${Locations.caneLocation.address}');
    return Locations.caneLocation.address;
  }

  void setMyLocation(String? location, context) {
    if (location == null) {
      return;
    }
    Provider.of<StringsManager>(context, listen: false).setMyLocation(location);
    MySharedPref.setMyLocation(location);
  }

  void setCaneLocation(String? location, context) {
    if (location == null) {
      return;
    }
    Provider.of<StringsManager>(context, listen: false)
        .setCaneLocation(location);
    MySharedPref.setCaneLocation(location);
  }
}
