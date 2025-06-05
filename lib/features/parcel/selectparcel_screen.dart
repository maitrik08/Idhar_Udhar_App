import 'package:flutter/material.dart';

import '../../shared/widgets/vehiclecard.dart';
class ParcelSelectionScreen extends StatelessWidget {
  const ParcelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Select a vehicle based on your parcel’s size and weight.",
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
              ),
              const SizedBox(height: 24),
              VehicleCard(
                icon: Icons.pedal_bike,
                title: "Quick & Light",
                subtitle:
                "Ideal for small parcels, documents, or lightweight items.",
                maxWeight: "Max 10 KG",
              ),
              const SizedBox(height: 12),
              VehicleCard(
                icon: Icons.directions_car,
                title: "Medium & Safe",
                subtitle:
                "Perfect for electronics, boxes, and mid-size deliveries.",
                maxWeight: "Max 50 KG",
              ),
              const SizedBox(height: 12),
              VehicleCard(
                icon: Icons.airport_shuttle,
                title: "Spacious & Strong",
                subtitle:
                "Best for furniture, heavier goods, or stacked parcels.",
                maxWeight: "Max 80 KG",
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/heavyparceltype'),
                child: VehicleCard(
                  icon: Icons.fire_truck,
                  title: "Heavy Duty",
                  subtitle:
                  "For bulk deliveries, industrial items, or extra-large loads.",
                  maxWeight: "Max 1000 KG",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



