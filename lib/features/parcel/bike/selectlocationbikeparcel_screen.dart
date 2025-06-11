import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../core/constants/constants.dart';
import '../deliverydatebottomsheet.dart';

class SelectBikeParcelScreen extends StatelessWidget {
  static const LatLng _center = LatLng(23.0225, 72.5714); // Ahmedabad

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 12,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          SlidingUpPanel(
            minHeight: size.height * 0.6,
            maxHeight: size.height * 0.6,
            isDraggable: false,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            panel: _buildBottomSheet(context),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "Confirm Delivery Details",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16 * textScale,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _locationField(
            icon: Icons.location_on,
            label: "Pickup Location",
            value: "Flat 301, Green Heights, Andheri West, Mumbai",
          ),
          const SizedBox(height: 15),
          Text("Sender Details", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
          const SizedBox(height: 25),
          _locationField(
            icon: Icons.location_on,
            label: "Drop Location",
            value: "Plot No 52, Tech Park, Hinjewadi, Pune",
          ),
          const SizedBox(height: 15),
          Text("Receiver Details", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: size.height * 0.06,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const DeliveryDateBottomSheet(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ButtonBorderRadius)),
              ),
              child: Text(
                "Confirm Address",
                style: TextStyle(fontSize: 14 * textScale, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationField({required IconData icon, required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.black),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
