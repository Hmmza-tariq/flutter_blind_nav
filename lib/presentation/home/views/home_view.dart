import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/presentation/home/views/widgets/location_widget.dart';
import 'package:blind_nav/presentation/widgets/screen_title.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter_map/src/geo/latlng_bounds.dart' as latLngBound;

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Row(
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           // Get.toNamed(Routes.LOCATION);
      //         },
      //         child: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(
      //               Icons.location_on,
      //               color: context.theme.iconTheme.color,
      //             ),
      //             SizedBox(
      //               width: 100.w,
      //               child: Text(
      //                 Provider.of<StringsManager>(context).location,
      //                 style: context.theme.textTheme.bodyMedium,
      //                 maxLines: 1,
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(width: 10),
      //       Expanded(
      //         child: TextField(
      //           decoration: InputDecoration(
      //             hintText: Provider.of<StringsManager>(context).search,
      //             filled: true,
      //             fillColor: Colors.white,
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(10),
      //               borderSide: BorderSide.none,
      //             ),
      //             prefixIcon: const Icon(Icons.search, color: Colors.grey),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         // Get.toNamed(Routes.NOTIFICATIONS);
      //       },
      //       icon: const Icon(Icons.notifications),
      //     ),
      //   ],
      // ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            ScreenTitle(
              title: Provider.of<StringsManager>(context).home,
            ),
            20.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                controller.navigateInMaps();
              },
              child: Text(
                Provider.of<StringsManager>(context).navigate,
                style: context.theme.textTheme.bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            20.verticalSpace,
            LocationWidget(
              controller: controller,
              isMine: true,
            ),
            FirebaseAnimatedList(
              reverse: true,
              shrinkWrap: true,
              query: controller.ref.limitToLast(1),
              itemBuilder: (context, snapshot, animation, index) {
                controller.getAddress(
                    snapshot.child('Latitude').value.toString(),
                    snapshot.child('Longitude').value.toString());
                return LocationWidget(
                  controller: controller,
                  isMine: false,
                );
              },
            ),
            10.verticalSpace,
            GetBuilder<HomeController>(
                init: HomeController(),
                id: 'Map',
                builder: (_) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.theme.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(3.r),
                      color: context.theme.colorScheme.surface,
                    ),
                    height: 300.h,
                    child: !controller.isLoading
                        ? FlutterMap(
                            options: MapOptions(
                              initialCenter: latLng.LatLng(
                                  Locations.myLocation.latitude,
                                  Locations.myLocation.longitude),
                              initialZoom: 20,
                              cameraConstraint: CameraConstraint.contain(
                                bounds: latLngBound.LatLngBounds(
                                  const latLng.LatLng(-90, -180),
                                  const latLng.LatLng(90, 180),
                                ),
                              ),
                            ),
                            children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  userAgentPackageName:
                                      'com.hexagone.blind_nav',
                                ),
                                CurrentLocationLayer(
                                  followOnLocationUpdate:
                                      FollowOnLocationUpdate.always,
                                  turnOnHeadingUpdate:
                                      TurnOnHeadingUpdate.never,
                                  style: LocationMarkerStyle(
                                    marker: DefaultLocationMarker(
                                      color: Theme.of(context).primaryColor,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                    markerSize: const Size(40, 40),
                                    markerDirection: MarkerDirection.heading,
                                  ),
                                ),
                                MarkerLayer(
                                  markers: [controller.customMarker],
                                  rotate: true,
                                  alignment: Alignment.topCenter,
                                )
                              ])
                        : Container(),
                  );
                }),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
