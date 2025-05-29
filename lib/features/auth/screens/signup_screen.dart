import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.grey[900],
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Text(
                  'Create a New Account',
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Center(
                child: Text(
                  'Join us to start your journey. Enter your details below to create a new account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: size.width * 0.035,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),

              _buildLabel("Name"),
              _buildInputField(icon: Icons.person, hint: "Enter your name"),
              SizedBox(height: size.height * 0.025),

              _buildLabel("Birthday"),
              _buildDatePickerField(context),
              SizedBox(height: size.height * 0.025),

              _buildLabel("Email"),
              _buildInputField(icon: Icons.email_outlined, hint: "Enter your email", inputType: TextInputType.emailAddress),
              SizedBox(height: size.height * 0.025),

              _buildLabel("Number"),
              _buildInputField(
                icon: Icons.phone_outlined,
                hint: "Enter your number",
                controller: _numberController,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: size.height * 0.08),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/otpscreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(color: Colors.white, fontSize: 15),
    );
  }
  Widget _buildInputField({
    required IconData icon,
    required String hint,
    TextInputType inputType = TextInputType.text,
    TextEditingController? controller,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70, size: 20),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54, fontSize: 13),
          border: InputBorder.none,
          isDense: true, // reduces height
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        ),
      ),
    );
  }
  Widget _buildDatePickerField(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: Container(
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.black45, // Change to your desired background color
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(10), // More curved edges
          ),
          child: TextField(
            controller: _dobController,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.calendar_today_outlined, color: Colors.white70, size: 20),
              hintText: "DD/MM/YYYY",
              hintStyle: TextStyle(color: Colors.white54, fontSize: 13),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

}
