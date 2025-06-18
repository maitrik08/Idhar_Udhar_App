import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import '../../core/constants/constants.dart';

class ChooseParcelThingScreen extends StatefulWidget {
  @override
  _ChooseParcelThingScreenState createState() => _ChooseParcelThingScreenState();
}

class _ChooseParcelThingScreenState extends State<ChooseParcelThingScreen> {
  String? selectedOption;

  final List<String> parcelOptions = [
    'Timber / Plywood / Laminate',
    'General',
    'Electrical / Electronics',
    'Building / Construction',
    'Catering / Restaurant',
    'Machines / Equipments',
    'Textile / Garments',
    'Furniture / Home Furnishing',
  ];

  void selectOption(String label) {
    setState(() {
      selectedOption = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'What Are You Sending?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45),

              // Subtitle
              Text(
                'Choose the type of parcel you want to ship.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),

              // Options
              Expanded(
                child: ListView.builder(
                  itemCount: parcelOptions.length,
                  itemBuilder: (context, index) {
                    final label = parcelOptions[index];
                    final isSelected = selectedOption == label;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        onPressed: () => selectOption(label),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? Colors.green.shade900
                              : Colors.grey.shade800,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonBorderRadius),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            label,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: selectedOption == null
                      ? null
                      : () {
                    Navigator.pushNamed(context, '/parcelsize');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonBorderRadius),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
