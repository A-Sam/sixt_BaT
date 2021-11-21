import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

part 'bookings.g.dart';

@JsonSerializable()
class Booking {
  Booking({
    required this.booking_id,
    required this.customer_id,
    required this.vehicle_id,
    required this.booking_time,
    this.success = false,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);

  final String booking_id;
  final String customer_id;
  final String vehicle_id;
  final String booking_time;
  final bool success;
}

//TODO Return Vehicle list
//void createBooking(Booking booking) {
void createBooking(String vehicleID) {
  print("In bookings.createBooking()");
  // var vehicleId = "1";
  var customerId = "2";
  var bookingTime = "";
  var bookingId = "DEMO";
  print(vehicleID);

  try {
    var booking = Booking(
        booking_id: bookingId,
        customer_id: customerId,
        vehicle_id: vehicleID,
        booking_time: bookingTime,
        success: true); //TODO proper try catch

    // TODO for now store in booking global var
    //File file = File('src/Assets/DemoDB.txt');
    //print("File accessed");

    // Write the file
    // file.writeAsString('$booking');
  } on Exception catch (e) {}

  Future<bool> getSuccessStatus(Booking booking) async {
    return booking.success;
  }
}
