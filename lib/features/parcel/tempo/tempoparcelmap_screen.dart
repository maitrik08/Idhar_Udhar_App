import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'tempoparceldetailpopup.dart';

class TempoParcelMapScreen extends StatefulWidget {
  const TempoParcelMapScreen({super.key});

  @override
  State<TempoParcelMapScreen> createState() => _TempoParcelMapScreenState();
}

class _TempoParcelMapScreenState extends State<TempoParcelMapScreen> {
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
          const TempoParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
