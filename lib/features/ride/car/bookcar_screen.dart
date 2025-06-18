import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../core/constants/constants.dart';

class BookCarScreen extends StatefulWidget {
  const BookCarScreen({super.key});

  @override
  State<BookCarScreen> createState() => _BookCarScreenState();
}

class _BookCarScreenState extends State<BookCarScreen> {
  final PanelController _panelController = PanelController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const LatLng _center = LatLng(23.0225, 72.5714); // Ahmedabad

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallDevice = size.height < 700;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),

          SlidingUpPanel(
            controller: _panelController,
            minHeight: isSmallDevice ? 250 : 280,
            maxHeight: isSmallDevice ? 250 : 280,
            isDraggable: false,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            panel: _buildPanel(context, size, textScale),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context, Size size, double textScale) {
    final double padding = size.width * 0.04;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Car Tile
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 35),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: AppColors.primary, width: 1.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: padding / 1.5, vertical: 4),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(Icons.directions_car, color: Colors.black),
                ),
                title: Text("Car",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14 * textScale,
                        color: Colors.white)),
                subtitle: Text("5:55 pm    3 mins",
                    style: TextStyle(fontSize: 12 * textScale, color: Colors.white70)),
                trailing: Text(
                  "₹124",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * textScale,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: size.height * 0.01),

        // Payment method
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: const ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.credit_card, color: Colors.black),
            title: Text("Credit Card",
                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
          ),
        ),

        SizedBox(height: size.height * 0.003),

        // Buttons
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/searchcardriver'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: Size.fromHeight(size.height * 0.055),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonBorderRadius),
                    ),
                  ),
                  child: Text("Ready to Ride",
                      style: TextStyle(fontSize: 13 * textScale, color: Colors.white)),
                ),
              ),
              SizedBox(width: padding / 2),
              Container(
                height: size.height * 0.055,
                width: size.height * 0.055,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 1),
                        blurRadius: 3,
                        spreadRadius: 0.1
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.calendar_month_outlined, color: Colors.black, size: 27),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary, // ✅ selected date and header background
              onPrimary: Colors.black,    // ✅ text color on header (e.g., month/year)
              onSurface: Colors.white,    // ✅ default text color
            ),
            dialogBackgroundColor: Colors.white, // ✅ background of the date picker dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary
                , // ✅ color for OK/CANCEL
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      print("Selected date: $picked");
    }
  }

}
