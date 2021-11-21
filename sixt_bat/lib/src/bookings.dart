import 'dart:convert';
//import 'dart:html';
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

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);


}

//void createBooking(Booking booking) {
void createBooking() async {
  print("In bookings.createBooking()");
  var vehicleId = "1";
  var customerId = "2";
  var bookingTime = "";
  var bookingId = "DEMO";

  var booking = Booking(booking_id: bookingId,
        customer_id: customerId,
        vehicle_id: vehicleId,
        booking_time: bookingTime,
        success : true); //TODO proper try catch
  print("Booking done for : "+booking.booking_id);

  String jsonBooking = jsonEncode(booking);
  print("json : "+jsonBooking);

    // TODO for now store in booking global var
   File file = File('lib/src/Assets/DemoDB.txt');
    print("File accessed");

    // Write the file
    //file.writeAsString("abc");
    await file.writeAsString(jsonBooking);


  Future<bool> getSuccessStatus(Booking booking) async {

    return booking.success;
  }

}