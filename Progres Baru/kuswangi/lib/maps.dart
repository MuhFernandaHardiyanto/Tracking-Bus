import 'package:flutter/material.dart';
import 'komponen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:async';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  // Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(-8.591204, 116.116208),
  //   zoom: 14.4746,
  // );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(-8.591204, 116.116208),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[900],
        title: new Center(child: new Text(
          'MAPS BUS BANYUWANGI',
          style: txtappbar,
        ),)
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(-8.591204, 116.116208),
        zoom: 19.151926040649414
        ),
        
        // _kGooglePlex,
        // onMapCreated: (GoogleMapController controller) {
        //   _controller.complete(controller);
        
      ),
    );

    // Future<void> _goToTheLake() async {
    //   final GoogleMapController controller = await _controller.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));}
  }
}