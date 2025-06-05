import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';


class ParcelSizeScreen extends StatefulWidget {
  @override
  _ParcelSizeScreenState createState() => _ParcelSizeScreenState();
}

class _ParcelSizeScreenState extends State<ParcelSizeScreen> {
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  bool get isFormComplete =>
      widthController.text.isNotEmpty &&
          lengthController.text.isNotEmpty &&
          heightController.text.isNotEmpty;

  void _onChanged() => setState(() {}); // Rebuild UI when text changes

  @override
  void initState() {
    super.initState();
    widthController.addListener(_onChanged);
    lengthController.addListener(_onChanged);
    heightController.addListener(_onChanged);
  }

  @override
  void dispose() {
    widthController.dispose();
    lengthController.dispose();
    heightController.dispose();
    super.dispose();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(width: 10,),
                    const Text(
                      'Enter Parcel Size',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 50,),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    _buildTextField('Enter your Parcel Width', widthController),
                    const SizedBox(height: 12),
                    _buildTextField('Enter your Parcel Length', lengthController),
                    const SizedBox(height: 12),
                    _buildTextField('Enter your Parcel Height', heightController),
                    const SizedBox(height: 40),
                  ],
                ),
                ElevatedButton(
                  onPressed: isFormComplete ? () {
                    Navigator.pushNamed(context, '/selectparcelbike');
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isFormComplete ? AppColors.primary : AppColors.primarylite,
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

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
