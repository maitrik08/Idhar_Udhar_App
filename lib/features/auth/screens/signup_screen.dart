import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart';
import '../../../core/services/authservices.dart';
import 'otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _submitted = false;
  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.grey,
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

  Future<void> _handleSignup() async {
    setState(() => _submitted = true);

    final name = _nameController.text.trim();
    final dob = _dobController.text.trim();
    final email = _emailController.text.trim();
    final phone = _numberController.text.trim();

    if (name.isEmpty || dob.isEmpty || email.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields.")),
      );
      return;
    }

    try {
      setState(() => _isLoading = true);
      final response = await AuthService.signUp(
        name: name,
        email: email,
        dob: dob,
        phone: phone,
      );
      print("Signup Payload: name=$name, email=$email, dob=$dob, number=$phone");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userId = data['userId'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', userId);
        await AuthService.sendOTP(identifier: userId);

        Navigator.push(context, MaterialPageRoute(builder: (_) =>  OTPScreen()));
      } else {
        print('$name $phone $dob $email');
        print("Error: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup failed: ${response.body}")),
        );
      }
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _dobController.dispose();
    _numberController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
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
              const SizedBox(height: 8),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Join us to start your journey. Enter your details below to create a new account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.width * 0.03,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),

              _buildLabel("Name"),
              _buildInputField(controller: _nameController, icon: Icons.person, hint: "Enter your name"),

              SizedBox(height: size.height * 0.025),
              _buildLabel("Birthday"),
              _buildDatePickerField(context),

              SizedBox(height: size.height * 0.025),
              _buildLabel("Number"),
              _buildInputField(
                controller: _numberController,
                icon: Icons.phone_outlined,
                hint: "Enter your number",
                inputType: TextInputType.phone,
              ),

              SizedBox(height: size.height * 0.025),
              _buildLabel("Email"),
              _buildInputField(
                controller: _emailController,
                icon: Icons.email_outlined,
                hint: "Enter your email",
                inputType: TextInputType.emailAddress,
              ),



              SizedBox(height: size.height * 0.17),
              _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Colors.white))
                  : SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _handleSignup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonBorderRadius),
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

              SizedBox(height: size.height * 0.01),
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
    return Text(label, style: const TextStyle(color: Colors.white, fontSize: 15));
  }

  Widget _buildInputField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(buttonBorderRadius),
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
          isDense: true,
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
            color: Colors.black45,
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(buttonBorderRadius),
          ),
          child: TextField(
            controller: _dobController,
            readOnly: true,
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
