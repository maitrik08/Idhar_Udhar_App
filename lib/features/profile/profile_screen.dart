import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerHeight = size.height * 0.20;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Header with user info
          Container(
            height: headerHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00C853),
                  Color(0xFF64DD17)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Name : Floyd Miles',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Number : +91 9876543160',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Options
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  profileOption(Icons.shopping_bag, "Your Orders"),
                  profileOption(Icons.help_outline, "Help & Support"),
                  profileOption(Icons.location_on, "Address"),
                  profileOption(Icons.card_giftcard, "Rewards"),
                  profileOption(Icons.payment, "Payment Settings"),
                  profileOption(Icons.privacy_tip, "Account Privacy"),
                  profileOption(Icons.logout, "Log Out"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.5,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}