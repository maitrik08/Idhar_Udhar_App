import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/profile/profileimagepicksheet.dart';
import 'logoutpopup.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImageProvider _profileImage = const AssetImage('assets/images/profile.png');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerHeight = size.height * 0.20;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: headerHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00C853), Color(0xFF64DD17)],
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
                  top: 12,
                  left: 12,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: _profileImage,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                ProfilePhotoPicker.show(context, (imageProvider) {
                                  setState(() {
                                    _profileImage = imageProvider;
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white, width: 1.5),
                                ),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(Icons.camera_alt, color: Colors.black, size: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Name : Floyd Miles',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Number : +91 9876543160',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/myride'),
                      child: profileOption('assets/images/profile/myride.png', "My Ride")),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/helpandsupport'),
                      child: profileOption('assets/images/profile/helpandsupport.png', "Help & Support")),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/addressdetail'),
                      child: profileOption('assets/images/profile/address.png', "Address")),
                  InkWell(
                      onTap: () =>Navigator.pushNamed(context, '/rewards'),
                      child: profileOption('assets/images/profile/reward.png', "Rewards")),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/paymentsetting'),
                      child: profileOption('assets/images/profile/payment.png', "Payment Settings")),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/privacyandsecurity'),
                      child: profileOption('assets/images/profile/privacy.png', "Account Privacy")),
                  InkWell(
                      onTap: () => showLogoutDialog(context),
                      child: profileOption('assets/images/profile/logout.png', "Log Out")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileOption(String imagePath, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(imagePath, width: 22, height: 22, color: Colors.white),
          ),
          const SizedBox(width: 18),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 15.5, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
