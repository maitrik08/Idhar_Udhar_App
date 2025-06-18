import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'carparceldetailpopup.dart';

class CarParcelMapScreen extends StatefulWidget {
  const CarParcelMapScreen({super.key});

  @override
  State<CarParcelMapScreen> createState() => _CarParcelMapScreenState();
}

class _CarParcelMapScreenState extends State<CarParcelMapScreen> {
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
          const CarParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
