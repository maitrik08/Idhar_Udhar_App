import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'truck14feetparceldetailpopup.dart';

class Truck14feetParcelMapScreen extends StatefulWidget {
  const Truck14feetParcelMapScreen({super.key});

  @override
  State<Truck14feetParcelMapScreen> createState() => _Truck14feetParcelMapScreenState();
}

class _Truck14feetParcelMapScreenState extends State<Truck14feetParcelMapScreen> {
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
          const Truck14feetParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
