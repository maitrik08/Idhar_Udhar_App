import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/features/ride/car/carRideDetail_screen.dart';

class ConfirmCarMapWrapperScreen extends StatefulWidget {
  const ConfirmCarMapWrapperScreen({super.key});

  @override
  State<ConfirmCarMapWrapperScreen> createState() => _ConfirmCarMapWrapperScreenState();
}

class _ConfirmCarMapWrapperScreenState extends State<ConfirmCarMapWrapperScreen> {
  bool showPopup = true;
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
            onTap: (_) {
              setState(() {
                showPopup = false;
              });
            },
          ),

          // Draggable popup when visible
          if (showPopup)
            Align(
              alignment: Alignment.bottomCenter,
              child: CarRideDetailsPopup(),
            ),

          // FAB to reopen the popup
          if (!showPopup)
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.blue,
                onPressed: () {
                  setState(() {
                    showPopup = true;
                  });
                },
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ),
        ],
      ),
    );
  }
}
