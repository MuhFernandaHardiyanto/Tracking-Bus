import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}





// import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Beranda extends StatefulWidget {
//   @override
//   _BerandaState createState() => _BerandaState();
// }

// class _BerandaState extends State<Beranda> {
//   Completer<GoogleMapController> _controller = Completer();
//   static const LatLng _center = const LatLng(111, -111);
//   final Set<Marker> _markers = {};
//   var _currentMapType = MapType.normal;

//   _onMapCreated(GoogleMapController controller){
//   _controller.complete(controller);
//   }

//   _onCameraMove(CameraPosition position){
//   }

//   Widget button(Function function, IconData icon){
//      return FloatingActionButton(
//        onPressed: function,
//        materialTapTargetSize: MaterialTapTargetSize.padded,
//        backgroundColor: Colors.blue,
//        child: Icon(
//          icon, size: 36.0,
//        ),
//      );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
//             mapType: _currentMapType,
//             markers: _markers,
//             onCameraMove: _onCameraMove,
//           ),
//           Padding(padding: EdgeInsets.all(16.0),
//           child: Align(
//             alignment: Alignment.topRight,
            
//           ),)
//         ],
//       ),
//     );
//   }
// }
