import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';

part 'bookings.g.dart';

@JsonSerializable()
class Booking {
  final String booking_id;
  final String customer_id;
  final String vehicle_id;
  final String booking_time;
  final bool success;

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
}

List<Booking> bookingsQueue = [];

Future<bool> getSuccessStatus(Booking booking) async {
  return booking.success;
}

//void createBooking(Booking booking) {
void createBooking(String vehicleId) async {
  print("In bookings.createBooking()");
  //var vehicleId = "1";
  var customerId = "2";
  var bookingTime = "21.11.2021 12:30";
  var bookingId = "DEMO";

  var booking = Booking(
      booking_id: bookingId,
      customer_id: customerId,
      vehicle_id: vehicleId,
      booking_time: bookingTime,
      success: true); //TODO proper try catch

  // bookings
  bookingsQueue.add(booking);
  print("------------- Currrent queued Bookings : ------------- \n");
  for (final b in bookingsQueue) {
    String jsonBooking = jsonEncode(b);
    print("Booking : " + jsonBooking.toString() + "\n");
  }

  // // TODO for now store in booking global var
  // File file = File('lib/src/Assets/DemoDB.txt');
  // print("File accessed");

  // // Write the file
  // await file.writeAsString("");
  // return true;
}
