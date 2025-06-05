import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class ChoosePrcelThingScreen extends StatefulWidget {
  @override
  _ChoosePrcelThingScreenState createState() => _ChoosePrcelThingScreenState();
}

class _ChoosePrcelThingScreenState extends State<ChoosePrcelThingScreen> {
  String? selectedOption;

  final List<Map<String, dynamic>> parcelOptions = [
    {'label': '📁  Document'},
    {'label': '🪑  Furniture',},
    {'label': '📱  Electronics'},
    {'label': '📦  Others'},
  ];

  void selectOption(String label) {
    setState(() {
      selectedOption = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    SizedBox(width: 15),
                    Text(
                      'What Are You Sending?',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Choose the type of parcel you want to ship.',
                      style: TextStyle(color: Colors.grey[400],fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    ...parcelOptions.map((option) {
                      bool isSelected = selectedOption == option['label'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: ElevatedButton(
                          onPressed: () => selectOption(option['label']),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            isSelected ? AppColors.primarylite : Colors.grey[850],
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                option['label'],
                                style: const TextStyle(fontSize: 16,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/parcelsize');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
