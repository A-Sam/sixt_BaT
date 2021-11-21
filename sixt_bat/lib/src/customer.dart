import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.dob,
    required this.current_loc,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  final String id;
  final String name;
  final String dob;
  final LatLng current_loc;
}

//TODO Return Vehicle list
void getNearestVehicles() async {

  print("in customer.getNearestVehicle()");
}

