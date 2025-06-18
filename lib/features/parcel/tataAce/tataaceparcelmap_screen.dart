import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'tataaceparceldetailpopup.dart';

class TataAceParcelMapScreen extends StatefulWidget {
  const TataAceParcelMapScreen({super.key});

  @override
  State<TataAceParcelMapScreen> createState() => _TataAceParcelMapScreenState();
}

class _TataAceParcelMapScreenState extends State<TataAceParcelMapScreen> {
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
          const TataAceParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
