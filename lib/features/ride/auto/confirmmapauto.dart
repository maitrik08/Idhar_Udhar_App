import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'autoridedetailpopup.dart';

class ConfirmAutoMapWrapperScreen extends StatelessWidget {
  const ConfirmAutoMapWrapperScreen({super.key});

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

          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.05,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return AutoRideDetailsPopup(scrollController: scrollController);
            },
          ),
        ],
      ),
    );
  }
}
