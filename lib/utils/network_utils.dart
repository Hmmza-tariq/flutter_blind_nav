import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  Future<String?> fetchUrl(Uri url, {Map<String, String>? header}) async {
    try {
      final response = await http.get(url, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<String> getAddressFromLatLng(String latitude, String longitude) async {
    try {
      double lat = double.parse(latitude);
      double lng = double.parse(longitude);
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];
      return "${place.street}, ${place.locality}";
    } catch (e) {
      debugPrint(e.toString());
      return "Failed to get address";
    }
  }
}
