import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dutyTruckparceldetailpopup.dart';

class DutyTruckParcelMapScreen extends StatefulWidget {
  const DutyTruckParcelMapScreen({super.key});

  @override
  State<DutyTruckParcelMapScreen> createState() => _DutyTruckParcelMapScreenState();
}

class _DutyTruckParcelMapScreenState extends State<DutyTruckParcelMapScreen> {
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
          const DutyTruckParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
