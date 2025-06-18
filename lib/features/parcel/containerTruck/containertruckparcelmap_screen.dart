import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'containertruckparceldetailpopup.dart';

class ContainertruckParcelMapScreen extends StatefulWidget {
  const ContainertruckParcelMapScreen({super.key});

  @override
  State<ContainertruckParcelMapScreen> createState() => _ContainertruckParcelMapScreenState();
}

class _ContainertruckParcelMapScreenState extends State<ContainertruckParcelMapScreen> {
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
          const ContainerTruckParcelDetailsPopup(), // stays here
        ],
      ),

    );
  }
}
