// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      vehicleID: json['vehicleID'] as String,
      coords: LatLng.fromJson(json['coords'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'vehicleID': instance.vehicleID,
      'coords': instance.coords,
      'status': instance.status,
    };

Fleet _$FleetFromJson(Map<String, dynamic> json) => Fleet(
      vehicles: (json['vehicles'] as List<dynamic>)
          .map((e) => Vehicle.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$FleetToJson(Fleet instance) => <String, dynamic>{
      'vehicles': instance.vehicles,
    };
