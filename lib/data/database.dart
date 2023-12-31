import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/presentation/base/controllers/base_controller.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseManager {
  static final databaseReference = FirebaseDatabase.instance
      .ref("BlindNav-Data")
      .child(BaseController.caneId);

  static void addLocationHistory() {
    print('Adding Location History ${BaseController.caneId}');
    databaseReference
        .child(
            '${DateTime.now().day.toString()} ${DateTime.now().hour.toString()} ${DateTime.now().second.toString()} ${DateTime.now().millisecond.toString()} ${DateTime.now().microsecond.toString()}')
        .set({
      'Latitude': Locations.caneLocation.latitude,
      'Longitude': Locations.caneLocation.longitude
    });
  }
}
