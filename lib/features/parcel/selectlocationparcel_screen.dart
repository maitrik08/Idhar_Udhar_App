import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/constants.dart';
import 'deliverydatebottomsheet.dart';

class SelectParcelScreen extends StatefulWidget {
  @override
  State<SelectParcelScreen> createState() => _SelectParcelScreenState();
}

class _SelectParcelScreenState extends State<SelectParcelScreen> with TickerProviderStateMixin {
  static const LatLng _center = LatLng(23.0225, 72.5714);

  bool isSenderExpanded = false;
  bool isReceiverExpanded = false;

  late AnimationController senderController;
  late AnimationController receiverController;

  final PanelController _panelController = PanelController();

  @override
  void initState() {
    super.initState();
    senderController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    receiverController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _panelController.animatePanelToPosition(1.0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    senderController.dispose();
    receiverController.dispose();
    super.dispose();
  }

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
            controller: _panelController,
            minHeight: size.height * 0.15,
            maxHeight: size.height * 0.6,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            panelBuilder: (ScrollController sc) => _buildBottomSheet(context, sc),
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, ScrollController sc) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        controller: sc,
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
          GestureDetector(
            onTap: () {
              setState(() {
                isSenderExpanded = !isSenderExpanded;
                isSenderExpanded ? senderController.forward(from: 0) : senderController.reverse();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sender Details", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          SizeTransition(
            sizeFactor: CurvedAnimation(parent: senderController, curve: Curves.easeInOut),
            axisAlignment: -1,
            child: _rowFields(["Full Name", "Contact Number"]),
          ),
          const SizedBox(height: 25),
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
                isReceiverExpanded ? receiverController.forward(from: 0) : receiverController.reverse();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Receiver Details", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          SizeTransition(
            sizeFactor: CurvedAnimation(parent: receiverController, curve: Curves.easeInOut),
            axisAlignment: -1,
            child: _rowFields(["Full Name", "Contact Number"]),
          ),
          const SizedBox(height: 20),
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

  Widget _rowFields(List<String> hints) {
    return Row(
      children: [
        Expanded(
          child: _animatedField(hints[0]).animate().fadeIn(duration: 500.ms).moveY(begin: 30, end: 0),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _animatedField(hints[1]).animate().fadeIn(duration: 500.ms).moveY(begin: 30, end: 0),
        ),
      ],
    );
  }

  Widget _animatedField(String hint) {
    return Container(
      height: 40,
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
          ),
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
