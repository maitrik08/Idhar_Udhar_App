import 'package:flutter/material.dart';
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
              const Center(
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
              VehicleCard(
                icon: Icons.fire_truck,
                title: "Heavy Duty",
                subtitle:
                "For bulk deliveries, industrial items, or extra-large loads.",
                maxWeight: "Max 1000 KG",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String maxWeight;

  const VehicleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.maxWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C742F), // green background
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            maxWeight,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
