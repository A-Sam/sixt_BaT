import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as fleet;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};

  late BitmapDescriptor myIcon;

  @override
  // void initState() {
  //   BitmapDescriptor.fromAssetImage(
  //           const ImageConfiguration(size: Size(48, 48)),
  //           '/Users/sam/ws/private-projects/sixt_BaT/sixt_bat/assets/mobileye_robotaxi.png')
  //       .then((onValue) {
  //     myIcon = onValue;
  //     print("onvalue ....");
  //   });
  //   print("initialized ....");
  // }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final vehicles = await fleet.getVehicles();
    setState(() {
      _markers.clear();
      for (final vehicle in vehicles) {
        final marker = Marker(
          markerId: MarkerId(vehicle.vehicleID),
          position: LatLng(vehicle.lat, vehicle.lng),
          infoWindow: InfoWindow(
            title: vehicle.vehicleID,
            snippet: vehicle.charge.toString(),
          ),
          // icon: myIcon
        );
        _markers[vehicle.vehicleID] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Office Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
