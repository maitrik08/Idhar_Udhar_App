import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../core/constants/constants.dart';
import 'deliverydatebottomsheet.dart';

class SelectBikeParcelScreen extends StatefulWidget {
  @override
  State<SelectBikeParcelScreen> createState() => _SelectBikeParcelScreenState();
}

class _SelectBikeParcelScreenState extends State<SelectBikeParcelScreen> {
  static const LatLng _center = LatLng(23.0225, 72.5714); // Ahmedabad

  bool isSenderExpanded = false;
  bool isReceiverExpanded = false;

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _locationField(
                    icon: Icons.location_on,
                    label: "Pickup Location",
                    value: "Flat 301, Green Heights, Andheri West, Mumbai",
                  ),
                  const SizedBox(height: 15),

                  // Sender Section
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSenderExpanded = !isSenderExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sender Details", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
                        Icon(
                          isSenderExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: isSenderExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    firstChild: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 40, // Set fixed height
                        child: Row(
                          children: [
                            Expanded(child: _formField("Full Name")),
                            const SizedBox(width: 10),
                            Expanded(child: _formField("Contact Number")),
                          ],
                        ),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),

                  const SizedBox(height: 25),

                  // Receiver Section
                  _locationField(
                    icon: Icons.location_on,
                    label: "Drop Location",
                    value: "Plot No 52, Tech Park, Hinjewadi, Pune",
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isReceiverExpanded = !isReceiverExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Receiver Details", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
                        Icon(
                          isReceiverExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: isReceiverExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    firstChild: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(child: _formField("Full Name")),
                            const SizedBox(width: 10),
                            Expanded(child: _formField("Contact Number")),
                          ],
                        ),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                ),
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

  Widget _formField(String hint) {
    return Container(
      height: 38,
      child: TextField(
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).textScaleFactor * 10,
          ),
          filled: true,
          fillColor: Colors.black,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary),
          )
        ),
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
