import 'package:flutter/material.dart';

import '../../shared/widgets/vehiclecard.dart';

class HeavyParcelSelectionScreen extends StatelessWidget {
  const HeavyParcelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with back arrow
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Heavy or Light, We’ve Got the Right Ride",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children:  [
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/chooseparcelthing'),
                        child: VehicleCard(
                          icon: Icons.pedal_bike,
                          title: "Tempo",
                          subtitle:
                          "For light commercial deliveries and small-sized goods.",
                          maxWeight: "Max 200 KG",
                        ),
                      ),
                      SizedBox(height: 12),
                      VehicleCard(
                        icon: Icons.directions_car,
                        title: "Mini Truck",
                        subtitle:
                        "Ideal for moderate loads like multiple boxes or appliances.",
                        maxWeight: "Max 500 KG",
                      ),
                      SizedBox(height: 12),
                      VehicleCard(
                        icon: Icons.airport_shuttle,
                        title: "14 Ft Truck",
                        subtitle:
                        "Great for bulk items, small furniture, and larger parcels.",
                        maxWeight: "Max 1000 KG",
                      ),
                      SizedBox(height: 12),
                      VehicleCard(
                        icon: Icons.fire_truck,
                        title: "Covered Truck",
                        subtitle:
                        "For bulk deliveries, industrial items, or extra-large loads.",
                        maxWeight: "Max 2000 KG",
                      ),
                      SizedBox(height: 12),
                      VehicleCard(
                        icon: Icons.local_shipping,
                        title: "Open Trailer",
                        subtitle:
                        "Used for transporting oversized or construction materials.",
                        maxWeight: "",
                      ),
                      SizedBox(height: 12),
                      VehicleCard(
                        icon: Icons.local_shipping,
                        title: "Reefer Trailer",
                        subtitle:
                        "Temperature-controlled for food, medicine, or frozen items.",
                        maxWeight: "",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
