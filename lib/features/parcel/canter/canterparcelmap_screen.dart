import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'canterparceldetailpopup.dart';

class CanterParcelMapScreen extends StatefulWidget {
  const CanterParcelMapScreen({super.key});

  @override
  State<CanterParcelMapScreen> createState() => _CanterParcelMapScreenState();
}

class _CanterParcelMapScreenState extends State<CanterParcelMapScreen> {
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
          const CanterParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
