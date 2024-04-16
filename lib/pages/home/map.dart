import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  late GoogleMapController mapController;
   
  final LatLng _center = const LatLng(-33.86, 151.20);
   
   void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
      title: const Image(
      image: AssetImage('assets/images/smallslogan.png'), // profile pic needs to be replaced with company logo 
      fit: BoxFit.cover
      ),
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: false,
      shape: const Border(
      bottom: BorderSide(
        color: Colors.black,
        width: 0.5,
      ),
      ),
    ),
        body: const Text("This is a page"),//GoogleMap(
      //       onMapCreated: _onMapCreated,
      //       initialCameraPosition: CameraPosition(
      //         target: _center,
      //         zoom: 11.0,
      //       ),
      //   markers: {
      //    const Marker(
      //          markerId: MarkerId("Investment 1"),
      //          position: LatLng(-33.86, 151.20),
      //       ), // Marker
      // },  // CameraPosition
      //   ), // GoogleMap
      ), // Scaffold
    ); // MaterialApp
  }
}