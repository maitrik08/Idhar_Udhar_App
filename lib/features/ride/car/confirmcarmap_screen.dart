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
          ),

          // Bottom popup panel
          if (showPopup)
            SafeArea(
              bottom: false, // Prevent extra bottom padding
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6, // 30% of the screen height
                  color: Colors.black,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        children: const [
                          CarRideDetailsPopup(),
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