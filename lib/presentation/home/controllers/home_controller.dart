import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/data/models/location_model.dart';
import 'package:blind_nav/presentation/base/controllers/base_controller.dart';
import 'package:blind_nav/utils/network_utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as flutter_map;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:map_launcher/map_launcher.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  String myAddress = "";
  late flutter_map.Marker customMarker;
  final ref = FirebaseDatabase.instance
      .ref("BlindNav-Data")
      .child(BaseController.caneId);

  @override
  void onInit() {
    super.onInit();
    customMarker = buildPin(latLng.LatLng(
        Locations.caneLocation.latitude, Locations.caneLocation.longitude));
    update(['Map']);
  }

  Future<void> openMaps(LocationModel locations) async {
    if (await MapLauncher.isMapAvailable(MapType.google) != null) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(locations.latitude, locations.longitude),
        title: locations.address,
      );
    }
  }

  Future<void> navigateInMaps() async {
    if (await MapLauncher.isMapAvailable(MapType.google) != null) {
      await MapLauncher.showDirections(
          directionsMode: DirectionsMode.walking,
          mapType: MapType.google,
          origin: Coords(
              Locations.myLocation.latitude, Locations.myLocation.longitude),
          destination: Coords(Locations.caneLocation.latitude,
              Locations.caneLocation.longitude));
    }
  }

  void getAddress(String latitude, String longitude) async {
    String address =
        await NetworkUtils().getAddressFromLatLng(latitude, longitude);
    Locations.caneLocation.latitude = double.parse(latitude);
    Locations.caneLocation.longitude = double.parse(longitude);
    debugPrint(
        '2- cane latitude: ${Locations.caneLocation.latitude},longitude: ${Locations.caneLocation.longitude} address: ${Locations.caneLocation.address}');

    Locations.caneLocation.address = address;
    customMarker = buildPin(latLng.LatLng(
        Locations.caneLocation.latitude, Locations.caneLocation.longitude));
    update(['Map']);
    // update(['history']);
  }

  flutter_map.Marker buildPin(latLng.LatLng point) => flutter_map.Marker(
        point: point,
        child: const Icon(Icons.blind_rounded, size: 60, color: Colors.orange),
        width: 60,
        height: 60,
      );
}
