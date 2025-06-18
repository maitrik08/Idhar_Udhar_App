import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pickuptruckparceldetailpopup.dart';

class PickupTruckParcelMapScreen extends StatefulWidget {
  const PickupTruckParcelMapScreen({super.key});

  @override
  State<PickupTruckParcelMapScreen> createState() => _PickupTruckParcelMapScreenState();
}

class _PickupTruckParcelMapScreenState extends State<PickupTruckParcelMapScreen> {
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
          const PickupTruckParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
