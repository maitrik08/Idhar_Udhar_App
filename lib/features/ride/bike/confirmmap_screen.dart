import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'ridedetailsPopup.dart'; // Make sure this path is correct

class ConfirmMapWrapperScreen extends StatefulWidget {
  const ConfirmMapWrapperScreen({super.key});

  @override
  State<ConfirmMapWrapperScreen> createState() => _ConfirmMapWrapperScreenState();
}

class _ConfirmMapWrapperScreenState extends State<ConfirmMapWrapperScreen> {
  bool _showSheet = true;
  static const LatLng destination = LatLng(23.0422, 72.5917);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (_showSheet) {
            setState(() {
              _showSheet = false;
            });
          }
        },
        child: Stack(
          children: [
            const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: destination,
                zoom: 16,
              ),
            ),
            if (_showSheet)
              DraggableScrollableSheet(
                initialChildSize: 0.55,
                minChildSize: 0.05,
                maxChildSize: 0.6,
                builder: (context, scrollController) {
                  return GestureDetector(
                    onTap: () {}, // Prevent tap inside sheet from closing it
                    child: BikeRideDetailsPopup(scrollController: scrollController),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
