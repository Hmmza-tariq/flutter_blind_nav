import 'package:blind_nav/data/models/location_model.dart';
import 'package:blind_nav/presentation/base/controllers/base_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

class HistoryController extends GetxController {
  final ref = FirebaseDatabase.instance
      .ref("locationHistory")
      .child(BaseController.name);

  Future<void> openMaps(LocationModel locations) async {
    if (await MapLauncher.isMapAvailable(MapType.google) != null) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(locations.latitude, locations.longitude),
        title: locations.address,
      );
    }
  }
}