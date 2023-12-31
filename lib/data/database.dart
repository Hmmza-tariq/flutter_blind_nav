import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/presentation/cane_id/controller/cane_id_controller.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseManager {
  static final databaseReference = FirebaseDatabase.instance
      .ref("locationHistory")
      .child(CaneIdController().caneId.toString());

  static void addLocationHistory() {
    print('Adding Location History ${CaneIdController().caneId}');
    databaseReference
        .child(
            '${Locations.caneLocation.address} ${DateTime.now().day.toString()} ${DateTime.now().hour.toString()} ${DateTime.now().second.toString()} ${DateTime.now().millisecond.toString()} ${DateTime.now().microsecond.toString()}')
        .set({
      'latitude': Locations.caneLocation.latitude,
      'longitude': Locations.caneLocation.longitude,
      'address': Locations.caneLocation.address,
      'time': DateTime.now().toString(),
      'id': CaneIdController().caneId, // every times id is unique
    });
  }
}
