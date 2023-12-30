import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/presentation/base/controllers/base_controller.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseManager {
  static final databaseReference = FirebaseDatabase.instance
      .ref("locationHistory")
      .child(BaseController.name);

  static void addLocationHistory() {
    print('Adding Location History ${BaseController.name}');
    databaseReference
        .child(
            '${Locations.caneLocation.address} ${DateTime.now().day.toString()} ${DateTime.now().hour.toString()} ${DateTime.now().second.toString()} ${DateTime.now().millisecond.toString()} ${DateTime.now().microsecond.toString()}')
        .set({
      'latitude': Locations.caneLocation.latitude,
      'longitude': Locations.caneLocation.longitude,
      'address': Locations.caneLocation.address,
      'time': DateTime.now().toString(),
      'id': DateTime.now().microsecond.toString(), // every times id is unique
    });
  }
}
