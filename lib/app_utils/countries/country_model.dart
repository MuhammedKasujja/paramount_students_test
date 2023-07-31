import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:paramount_students/models/custom_exception.dart';

class Country with ChangeNotifier {
  final String name;
  final String? code;
  final String? dialCode;
  final String? flagPath;
  String? currentCountry, pickedCountry;
  String? countryId;

  Country({
    this.name = '',
    this.code,
    this.dialCode,
    this.flagPath,
  });

  String? get flagDestination {
    return flagPath;
  }

  String? get dialingCode {
    return dialCode;
  }

  String? get countryName {
    return name;
  }

  String? get id {
    return countryId;
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
        name: map['name'].toString(),
        code: map['code'].toString(),
        dialCode: map['dial_code'].toString(),
        flagPath:
            'packages/paramount_students/assets/countries/flags/${map['code']?.toLowerCase()}.png');
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          dialCode == other.dialCode;

  @override
  int get hashCode => name.hashCode ^ dialCode.hashCode;

  Future<Position> _determineLocation() async {
    LocationPermission permission;
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(CustomException(
          'Location services are disabled. Please enable the services'));
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(CustomException('Location Permissions denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(CustomException(
          'Location permissions are permanently denied, we cannot request permissions.'));
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> _getCountryNameFromLatLng(Position position) async {
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemarks[0];
    return place.country!;
  }

  Future<void> fetchAndSetCountryData() async {
    try {
      //getting geo location of user device
      final currentPosition = await _determineLocation();
      //extracting address from location coordinates
      currentCountry = await _getCountryNameFromLatLng(currentPosition);

      // Fetch country codes from the json file
      final countryCodesResponse =
          await rootBundle.loadString('assets/countries/codes.json');
      final listOfCountryCodes = json.decode(countryCodesResponse);

      // extracting current country data
      final countryData = listOfCountryCodes
          .firstWhere((data) => data['name'] == currentCountry);
      //setting dial id of current country

      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  bool contains(String query) {
    if (name.startsWith(query) || code == query) {
      return true;
    }
    return false;
  }
}
