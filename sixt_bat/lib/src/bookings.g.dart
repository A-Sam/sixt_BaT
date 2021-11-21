part of 'bookings.dart';

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
  booking_id: json['booking_id'] as String,
  customer_id: json['customer_id'] as String,
  vehicle_id: json['vehicle_id'] as String,
  booking_time: (json['booking_time'] as String),
  success: (json['success'] as bool),
);

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
  'booking_id': instance.booking_id,
  'customer_id': instance.customer_id,
  'vehicle_id': instance.vehicle_id,
  'booking_time': instance.booking_time,
  'success': instance.success,
};