import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

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

class Person {
  Person({
    required this.id,
    required this.name,
    required this.dob,
    required this.lat,
    required this.lng,
  });

  final String id;
  final String name;
  final String dob;
  final double lat;
  final double lng;
}

Future<List<Vehicle>> getVehicles() async {
  const fleetURL =
      "https://us-central1-sixt-hackatum-2021.cloudfunctions.net/api/vehicles";

  var vehicleMotionSimulator = new Random();
  double offset;

  // Retrieve the locations of vehicles
  try {
    final response = await http.get(Uri.parse(fleetURL));
    if (response.statusCode == 200) {
      // List<Vehicle> vehicles;
      List<dynamic> fleetJson = (json.decode(response.body) as List);
      List<Vehicle> fleetVehicles = [];
      for (final vehicle in fleetJson) {
        // offset = vehicleMotionSimulator.nextDouble();
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

// FIXME use the lnk to get persons as well as data!
Future<List<Person>> getPersons() async {
  const fleetURL =
      "https://us-central1-sixt-hackatum-2021.cloudfunctions.net/api/vehicles";

  // Retrieve the locations of vehicles
  try {
    final response = await http.get(Uri.parse(fleetURL));
    if (response.statusCode == 200) {
      // List<Vehicle> vehicles;
      List<dynamic> fleetJson = (json.decode(response.body) as List);
      List<Vehicle> fleetVehicles = [];
      List<Person> persons = [];
      int i = 0;
      for (final vehicle in fleetJson) {
        persons.add(Person(
            id: i.toString(),
            name: "ox",
            dob: "1/1/1",
            lat: double.parse(vehicle['lat'].toString()),
            lng: double.parse(vehicle['lng'].toString())));
        i++;
      }
      return persons;
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
