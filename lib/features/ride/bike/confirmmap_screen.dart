import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'ridedetailsPopup.dart';

class ConfirmMapWrapperScreen extends StatefulWidget {
  const ConfirmMapWrapperScreen({super.key});

  @override
  State<ConfirmMapWrapperScreen> createState() => _ConfirmMapWrapperScreenState();
}

class _ConfirmMapWrapperScreenState extends State<ConfirmMapWrapperScreen> {
  bool showPopup = true;
  static const LatLng destination = LatLng(23.0422, 72.5917);

  @override
  Widget build(BuildContext context) {
    final popupHeight = MediaQuery.of(context).size.height * 0.6;

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

          // Fixed-position popup
          if (showPopup)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: popupHeight,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Stack(
                  children: [
                    // Content
                    const BikeRideDetailsPopup(),

                    // Collapse button
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        onPressed: () {
                          setState(() => showPopup = false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Expand FAB
          if (!showPopup)
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.blue,
                onPressed: () {
                  setState(() => showPopup = true);
                },
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ),
        ],
      ),
    );
  }
}
