import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class PrivacyAndSecurityScreen extends StatefulWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  State<PrivacyAndSecurityScreen> createState() => _PrivacyAndSecurityScreenState();
}

class _PrivacyAndSecurityScreenState extends State<PrivacyAndSecurityScreen> {
  final Map<String, bool> settings = {
    'Location Sharing': false,
    'Data Collection': false,
    'Third-Party Sharing': false,
    'Personalization': false,
  };

  final Map<String, String> subTexts = {
    'Location Sharing': 'Allow app to access your location',
    'Data Collection': 'Collect data for service improvement',
    'Third-Party Sharing': 'Share data with partners for offers',
    'Personalization': 'Customize your experience based on data',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 20),
                child: Row(

                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.white, size: 28)
                    ),
                    Expanded(
                      child: const Center(
                        child: Text(
                          'Privacy & Security',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: settings.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    String key = settings.keys.elementAt(index);
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1C),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  key,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  subTexts[key]!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CupertinoSwitch(
                            value: settings[key]!,
                            onChanged: (bool value) {
                              setState(() {
                                settings[key] = value;
                              });
                            },
                            activeColor: AppColors.primary,
                            inactiveTrackColor: Colors.grey.shade700,
                            inactiveThumbColor: Colors.white,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
