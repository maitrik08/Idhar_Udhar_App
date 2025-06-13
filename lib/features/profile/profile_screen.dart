import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/profile/profileimagepicksheet.dart';
import '../../core/themes/colors.dart';
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gr1, AppColors.gr2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
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
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 42,
                            backgroundImage: _profileImage,
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
                      const SizedBox(width: 40),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Name : Floyd Miles',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Number : +91 9876543160',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
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
                  profileOption('assets/images/profile/myride.png', "My Ride",routeName:'/myride'),
                  profileOption('assets/images/profile/helpandsupport.png', "Help & Support",routeName:'/helpandsupport'),
                  profileOption('assets/images/profile/address.png', "Address",routeName:'/addressdetail'),
                  profileOption('assets/images/profile/reward.png', "Rewards",routeName:'/rewards'),
                  profileOption('assets/images/profile/payment.png', "Payment Settings",routeName:'/paymentsetting'),
                  profileOption('assets/images/profile/privacy.png', "Account Privacy",routeName:'/privacyandsecurity'),
                  profileOption('assets/images/profile/logout.png', "Log Out"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileOption(String imagePath, String title,{String? routeName}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          if (routeName == null || routeName.isEmpty) {
            showLogoutDialog(context);
          } else {
            Navigator.pushNamed(context, routeName);
          }
        },

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
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
