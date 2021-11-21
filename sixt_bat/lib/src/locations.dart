import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:developer';

// part 'locations.g.dart';

class Vehicle {
  Vehicle({
    required this.vehicleID,
    required this.status,
    required this.lat,
    required this.lng,
    required this.charge,
  });

  final String vehicleID;
  final String status;
  final double lat;
  final double lng;
  final double charge;
}

Future<List<Vehicle>> getVehicles() async {
  const fleetURL =
      "https://us-central1-sixt-hackatum-2021.cloudfunctions.net/api/vehicles";

  // Retrieve the locations of vehicles
  try {
    final response = await http.get(Uri.parse(fleetURL));
    if (response.statusCode == 200) {
      // List<Vehicle> vehicles;
      List<dynamic> fleetJson = (json.decode(response.body) as List);
      List<Vehicle> fleetVehicles = [];
      for (final vehicle in fleetJson) {
        fleetVehicles.add(Vehicle(
            vehicleID: vehicle['vehicleID'].toString(),
            status: vehicle['status'].toString(),
            lat: double.parse(vehicle['lat'].toString()),
            lng: double.parse(vehicle['lng'].toString()),
            charge: double.parse(vehicle['charge'].toString())));
      }
      return fleetVehicles;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  } catch (e) {
    print("ERROR: " + e.toString());
  }

  // Fallback for when the above HTTP request fails.
  return [];
}
