part of 'customer.dart';

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
    id: json['id'] as String,
    name: json['name'] as String,
    dob: (json['dob'] as String),
    current_loc: json['curr_loc'] as LatLng
);

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'dob': instance.dob,
  'current_loc' : instance.current_loc,
};