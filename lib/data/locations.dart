import 'package:blind_nav/data/models/location_model.dart';
import 'package:flutter_map/flutter_map.dart' as flutter_map;
import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/my_shared_pref.dart';
import 'package:blind_nav/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart' as latLng;

class Locations {
  static late LocationModel myLocation;
  static late LocationModel caneLocation;
  static late flutter_map.Marker customMarker;

  Future<void> getLocations() async {
    await getMyLocation();
    await getCaneLocation();
    Locations.customMarker = buildPin(latLng.LatLng(
        Locations.caneLocation.latitude, Locations.caneLocation.longitude));
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
    //get cane location from firebase
    Locations.caneLocation =
        LocationModel(latitude: 33.630, longitude: 72.9575984, address: 'EME');
    debugPrint('latitude: 33.630, longitude: 72.9575984, address: EME');
    return 'EME';
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

  flutter_map.Marker buildPin(latLng.LatLng point) => flutter_map.Marker(
        point: point,
        child: const Icon(Icons.blind_rounded, size: 60, color: Colors.orange),
        width: 60,
        height: 60,
      );
}
