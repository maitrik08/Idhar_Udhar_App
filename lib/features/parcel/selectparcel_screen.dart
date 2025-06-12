import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';

import '../../shared/widgets/vehiclecard.dart';
class ParcelSelectionScreen extends StatelessWidget {
  const ParcelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                child: Stack(
                  children: [
                    const Text(
                      "Select a vehicle based on your parcel’s size and weight.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Positioned(
                      width: 28,
                      bottom: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 21,top: 0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  rideType='bike-parcel';
                  Navigator.pushNamed(context, '/chooseparcelthing');
                },
                child: VehicleCard(
                  icon: Icons.pedal_bike,
                  title: "Quick & Light",
                  subtitle:
                  "Ideal for small parcels, documents, or lightweight items.",
                  maxWeight: "Max 10 KG",
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  rideType='car-parcel';
                Navigator.pushNamed(context, '/chooseparcelthing');},
                child: VehicleCard(
                  icon: Icons.directions_car,
                  title: "Medium & Safe",
                  subtitle:
                  "Perfect for electronics, boxes, and mid-size deliveries.",
                  maxWeight: "Max 50 KG",
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  rideType='auto-parcel';
                  Navigator.pushNamed(context, '/chooseparcelthing');
                },
                child: VehicleCard(
                  icon: Icons.electric_rickshaw_outlined,
                  title: "Spacious & Strong",
                  subtitle:
                  "Best for furniture, heavier goods, or stacked parcels.",
                  maxWeight: "Max 80 KG",
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  rideType='truck-parcel';
                  Navigator.pushNamed(context, '/heavyparceltype');
                },
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



