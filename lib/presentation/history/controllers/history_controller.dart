import 'package:blind_nav/data/models/location_model.dart';
import 'package:blind_nav/presentation/base/controllers/base_controller.dart';
import 'package:blind_nav/utils/network_utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

class HistoryController extends GetxController {
  final ref = FirebaseDatabase.instance
      .ref("BlindNav-Data")
      .child(BaseController.caneId);
  List<String> addresses = NetworkUtils().getAddresses();
  Future<void> openMaps(LocationModel locations) async {
    if (await MapLauncher.isMapAvailable(MapType.google) != null) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(locations.latitude, locations.longitude),
        title: locations.address,
      );
    }
  }

  void getAddress(String latitude, String longitude, int index) async {
    String address =
        await NetworkUtils().getAddressFromLatLng(latitude, longitude);
    addresses[index] = (address);
    update(['history']);
  }
}
