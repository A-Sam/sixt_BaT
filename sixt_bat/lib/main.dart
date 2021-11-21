import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/classes.dart' as fleet;
import 'src/bookings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  final Map<String, Marker> _markers = {};
  static const munichCenterLat = 48.1351;
  static const munichCenterLng = 11.5820;
  late TabController _tabController;
  late GoogleMapController global_controller_;

  BitmapDescriptor mapVehicleMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor mapPickupSpoteMarker = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    setCusomMarker();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void setCusomMarker() async {
    mapVehicleMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(60, 40)),
        'assets/mobileye_robotaxi.png');
  }

  // void onTapUpdateMarker() async {
  //   // floatingActionButton: FloatingActionButton(
  //   //       //  onPressed: () => bookings.createBooking(booking),
  //   //         onPressed: () => bookings.createBooking(),
  //   //         child: const Text('Book now'),
  //   //       ),
  //   // global_controller_.showMarkerInfoWindow(MarkerId("Wqn3DNzEh7o6d38Xta3r"));
  //   print("car selected");
  // }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final vehicles = await fleet.getVehicles();
    global_controller_ = controller;
    setState(() {
      _markers.clear();

      for (final vehicle in vehicles) {
        final marker = Marker(
            markerId: MarkerId(vehicle.vehicleID),
            position: LatLng(vehicle.lat, vehicle.lng),
            onTap: () => createBooking(vehicle.vehicleID),
            infoWindow: InfoWindow(
              title: vehicle.vehicleID,
              snippet: vehicle.charge.toString(),
            ),
            icon: mapVehicleMarker);
        _markers[vehicle.vehicleID] = marker;
      }
    });
  }

  // void _onMapUpdate(CameraPosition cam_pos) async {
  //   final vehicles = await fleet.getVehicles();
  //   setState(() {
  //     print("upadting.... " + cam_pos.target.latitude.toString());
  //     _markers.clear();
  //     for (final vehicle in vehicles) {
  //       final marker = Marker(
  //           markerId: MarkerId(vehicle.vehicleID),
  //           position: LatLng(vehicle.lat, vehicle.lng),
  //           infoWindow: InfoWindow(
  //             title: vehicle.vehicleID,
  //             snippet: "[Charge]\t" +
  //                 vehicle.charge.toString() +
  //                 "\n" +
  //                 "[lat,lng]\t" +
  //                 vehicle.lat.toString() +
  //                 ", " +
  //                 vehicle.lng.toString(),
  //           ),
  //           icon: mapVehicleMarker);
  //       _markers[vehicle.vehicleID] = marker;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sixt BaT',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.orange[400], elevation: 0),
        accentColor: Colors.orange[400],
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Center(
                child: GoogleMap(
              onMapCreated: _onMapCreated,
              // onCameraMove: _onMapUpdate,
              initialCameraPosition: const CameraPosition(
                target: LatLng(munichCenterLat, munichCenterLng),
                zoom: 13,
              ),
              markers: _markers.values.toSet(),
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: false,
            )),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.orange[400]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Booking",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.orange[400]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
          controller: _tabController,
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Material buildBottomNavigationBar() {
    return Material(
      elevation: 0.0,
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.orange[400],
        labelColor: Colors.orange[400],
        unselectedLabelColor: Colors.orange[400],
        tabs: [
          Tab(
            text: "Navigation",
            iconMargin: EdgeInsets.all(1.0),
          ),
          Tab(
            text: "Booking",
            iconMargin: EdgeInsets.all(1.0),
          ),
          Tab(
            text: "Settings",
            iconMargin: EdgeInsets.all(1.0),
          ),
        ],
      ),
    );
  }
}
