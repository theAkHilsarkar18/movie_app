// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
//
// import '../../home/provider/homeprovider.dart';
//
// class Mapscreen extends StatefulWidget {
//   const Mapscreen({Key? key}) : super(key: key);
//
//   @override
//   State<Mapscreen> createState() => _MapscreenState();
// }
//
// class _MapscreenState extends State<Mapscreen> {
//   @override
//   Widget build(BuildContext context) {
//
//     Completer<GoogleMapController> completer = Completer<GoogleMapController>();
//
//     Homeprovider homeproviderFalse = Provider.of(context, listen: false);
//     Homeprovider homeproviderTrue = Provider.of(context, listen: true);
//
//     return SafeArea(
//       child: Scaffold(
//         body: GoogleMap(
//           mapType: MapType.hybrid,
//           onMapCreated: (controller) => completer.complete(controller),
//           initialCameraPosition: CameraPosition(
//             target: LatLng(homeproviderTrue.latitude,homeproviderTrue.longitude),
//               zoom: 14.4746,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
        child: Icon(Icons.directions_sharp),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
