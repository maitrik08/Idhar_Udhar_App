import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'truck19feetparceldetailpopup.dart';

class Truck19feetParcelMapScreen extends StatefulWidget {
  const Truck19feetParcelMapScreen({super.key});

  @override
  State<Truck19feetParcelMapScreen> createState() => _Truck19feetParcelMapScreenState();
}

class _Truck19feetParcelMapScreenState extends State<Truck19feetParcelMapScreen> {
  static const LatLng destination = LatLng(23.0422, 72.5917);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: destination,
              zoom: 16,
            ),
            markers: {
              const Marker(
                markerId: MarkerId('destination'),
                position: destination,
              ),
            },
          ),
          const Truck19feetParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
