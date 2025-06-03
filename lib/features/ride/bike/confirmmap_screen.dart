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

          // Bottom popup panel
          if (showPopup)
            DraggableScrollableSheet(
              initialChildSize: 0.28,
              minChildSize: 0.2,
              maxChildSize: 0.6,
              builder: (context, scrollController) {
                return SafeArea(
                  bottom: false, // Prevent extra bottom padding
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Container(
                      color: Colors.black,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: Stack(
                        children: [
                          ListView(
                            controller: scrollController,
                            padding: EdgeInsets.zero,
                            physics: const ClampingScrollPhysics(),
                            children: const [
                              BikeRideDetailsPopup(),
                            ],
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: IconButton(
                              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                setState(() {
                                  showPopup = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),


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