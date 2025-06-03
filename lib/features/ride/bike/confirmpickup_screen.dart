// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:idhar_udhar/core/themes/colors.dart'; // Ensure AppColors.primary = green
// import 'package:sliding_up_panel/sliding_up_panel.dart';
//
// class ConfirmBikePickupScreen extends StatefulWidget {
//   const ConfirmBikePickupScreen({super.key});
//
//   @override
//   State<ConfirmBikePickupScreen> createState() => _ConfirmBikePickupScreenState();
// }
//
// class _ConfirmBikePickupScreenState extends State<ConfirmBikePickupScreen> {
//   final PanelController _panelController = PanelController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   static const LatLng _center = LatLng(23.0225, 72.5714); // Ahmedabad
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: const CameraPosition(
//               target: _center,
//               zoom: 12.0,
//             ),
//             myLocationEnabled: true,
//             myLocationButtonEnabled: false,
//           ),
//
//           SlidingUpPanel(
//             controller: _panelController,
//             minHeight: 250,
//             maxHeight: 400,
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
//             panel: _buildPanel(),
//             color: Colors.white, // Matches image
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPanel() {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Center(
//             child: Text(
//               "Confirm the pick-up location",
//               style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(height: 16),
//
//           // Input field + Search button
//           Row(
//             children: [
//               Expanded(
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     hintText: "201/203, opp. 108 Call Center",
//                     border: InputBorder.none,
//                     hintStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14
//                     )
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Container(
//                 height: 20,
//                 width: 60,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(40))
//                 ),
//                 child: Center(
//                   child: const Text(
//                     "Search",
//                     style: TextStyle(
//                         fontSize: 9,
//                       color: Colors.black
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 24),
//
//           // Confirm Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/searchbikedriver');
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primary,
//                 minimumSize: const Size.fromHeight(50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 "Confirm pick-up",
//                 style: TextStyle(fontSize: 14, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import '../../payment/allpaymentmethods.dart';

class ConfirmBikePickupScreen extends StatefulWidget {
  static const LatLng _center = LatLng(23.0225, 72.5714);

  const ConfirmBikePickupScreen({super.key});

  @override
  State<ConfirmBikePickupScreen> createState() => _ConfirmBikePickupScreenState();
}

class _ConfirmBikePickupScreenState extends State<ConfirmBikePickupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: ConfirmBikePickupScreen._center,
              zoom: 12.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Confirm the pick-up location",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "201/203, opp. 108 Call Center",
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Center(
                          child: Text(
                            "Search",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const PaymentMethodScreen(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Confirm pick-up", style: TextStyle(fontSize: 14,color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
