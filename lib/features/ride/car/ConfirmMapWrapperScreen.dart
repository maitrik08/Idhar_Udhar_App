import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/features/ride/car/carRideDetail_screen.dart';

class ConfirmCarMapWrapperScreen extends StatefulWidget {
  const ConfirmCarMapWrapperScreen({super.key});

  @override
  State<ConfirmCarMapWrapperScreen> createState() => _ConfirmCarMapWrapperScreenState();
}

class _ConfirmCarMapWrapperScreenState extends State<ConfirmCarMapWrapperScreen> {
  bool showPopup = false;
  static const LatLng destination = LatLng(23.0422, 72.5917);

  @override
  void initState() {
    super.initState();
    // Automatically show fixed bottom sheet on load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showFixedBottomSheet();
    });
  }

  void _showFixedBottomSheet() {
    setState(() {
      showPopup = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext bottomSheetContext) {
        final screenHeight = MediaQuery.of(bottomSheetContext).size.height;
        return SizedBox(
          height: screenHeight * 0.6, // 60% of screen height
          child: Stack(
            children: [
              const CarRideDetailsPopup(),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      showPopup = false;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
          if (!showPopup)
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.blue,
                onPressed: _showFixedBottomSheet,
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ),
        ],
      ),
    );
  }
}
