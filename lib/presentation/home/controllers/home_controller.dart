import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/data/models/location_model.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  Future<void> openMaps(LocationModel locations) async {
    if (await MapLauncher.isMapAvailable(MapType.google) != null) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(locations.latitude, locations.longitude),
        title: locations.address,
        // description: description,
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
          destination: Coords(
              Locations.caneLocation.latitude, Locations.caneLocation.longitude)
          // description: description,
          );
    }
  }
}
