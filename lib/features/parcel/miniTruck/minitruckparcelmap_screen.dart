import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'minitruckparceldetailpopup.dart';

class MinitruckParcelMapScreen extends StatefulWidget {
  const MinitruckParcelMapScreen({super.key});

  @override
  State<MinitruckParcelMapScreen> createState() => _MinitruckParcelMapScreenState();
}

class _MinitruckParcelMapScreenState extends State<MinitruckParcelMapScreen> {
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
          const MiniTruckParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
