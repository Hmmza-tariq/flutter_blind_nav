import 'package:blind_nav/config/assets_manager.dart';
import 'package:blind_nav/config/strings_manager.dart';
import 'package:blind_nav/data/locations.dart';
import 'package:blind_nav/data/models/location_model.dart';
import 'package:blind_nav/presentation/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.controller,
    required this.isMine,
  });

  final HomeController controller;
  final bool isMine;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            isMine
                ? Locations.myLocation.address
                : Locations.caneLocation.address,
            style: context.theme.textTheme.displayMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        ElevatedButton(
          onPressed: () async {
            isMine
                ? await controller.openMaps(LocationModel(
                    latitude: Locations.myLocation.latitude,
                    longitude: Locations.myLocation.longitude,
                    address: Locations.myLocation.address))
                : await controller.openMaps(LocationModel(
                    latitude: Locations.caneLocation.latitude,
                    longitude: Locations.caneLocation.longitude,
                    address: Locations.caneLocation.address));
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            fixedSize: const Size(double.infinity, 40),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: SvgPicture.asset(
                  AssetsManager.location,
                  color: context.theme.colorScheme.onPrimary,
                  height: 16,
                ),
              ),
              Text(
                  isMine
                      ? Provider.of<StringsManager>(context).myLocationText
                      : Provider.of<StringsManager>(context).caneLocationText,
                  style: context.theme.textTheme.bodySmall!
                      .copyWith(color: context.theme.colorScheme.onPrimary)),
            ],
          ),
        ),
      ],
    );
  }
}
