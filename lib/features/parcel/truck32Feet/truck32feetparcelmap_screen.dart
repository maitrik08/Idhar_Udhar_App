import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'truck32feetparceldetailpopup.dart';

class Truck32feetParcelMapScreen extends StatefulWidget {
  const Truck32feetParcelMapScreen({super.key});

  @override
  State<Truck32feetParcelMapScreen> createState() => _Truck32feetParcelMapScreenState();
}

class _Truck32feetParcelMapScreenState extends State<Truck32feetParcelMapScreen> {
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
          const Truck32feetParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
