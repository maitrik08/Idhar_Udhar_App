import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bikeparceldetailpopup.dart';

class BikeParcelMapScreen extends StatefulWidget {
  const BikeParcelMapScreen({super.key});

  @override
  State<BikeParcelMapScreen> createState() => _BikeParcelMapScreenState();
}

class _BikeParcelMapScreenState extends State<BikeParcelMapScreen> {
  static const LatLng destination = LatLng(23.0422, 72.5917);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Google Map
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

          // DraggableScrollable bottom sheet
          const BikeParcelDetailsPopup(),
        ],
      ),
    );
  }
}
