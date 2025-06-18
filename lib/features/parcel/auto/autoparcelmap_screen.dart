import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/features/parcel/auto/autoparceldetailpopup.dart';

class AutoParcelMapScreen extends StatefulWidget {
  const AutoParcelMapScreen({super.key});

  @override
  State<AutoParcelMapScreen> createState() => _AutoParcelMapScreenState();
}

class _AutoParcelMapScreenState extends State<AutoParcelMapScreen> {
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

          // Show popup if enabled
          if (showPopup)
            Align(
              alignment: Alignment.bottomCenter,
              child: AutoParcelDetailsPopup(), // This is now the draggable scrollable sheet
            ),

          // Button to bring popup back
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
