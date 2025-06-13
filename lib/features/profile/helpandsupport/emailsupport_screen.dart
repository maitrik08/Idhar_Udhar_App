import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'dart:io' show Platform;

import 'package:idhar_udhar/core/themes/colors.dart';

class EmailSupportScreen extends StatefulWidget {
  @override
  _EmailSupportScreenState createState() => _EmailSupportScreenState();
}

class _EmailSupportScreenState extends State<EmailSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> sendEmail() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final subject = subjectController.text.trim();
    final message = messageController.text.trim();

    final fullBody = 'Name: $name\nEmail: $email\n\nMessage:\n$message';

    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'android.intent.action.SEND',
        type: 'text/plain',
        package: 'com.google.android.gm',
        arguments: <String, dynamic>{
          'android.intent.extra.EMAIL': ['kachhdiyamaitri1112@gmail.com'],
          'android.intent.extra.SUBJECT': subject,
          'android.intent.extra.TEXT': fullBody,
        },
      );

      try {
        await intent.launch();
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gmail app not found or could not launch')),
        );
      }
    } else {
      final mailtoUri = Uri.parse(
          'mailto:kachhdiyamaitri1112@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(fullBody)}'
      );

      if (await canLaunchUrl(mailtoUri)) {
        await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open email app.')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Email Support",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Send us an email with your issue and we'll get back to you shortly.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 30),
                buildTextField("Name", "Enter your name", nameController),
                const SizedBox(height: 16),
                buildTextField("Email", "Enter your email", emailController),
                const SizedBox(height: 16),
                buildTextField("Subject", "Enter subject", subjectController),
                const SizedBox(height: 16),
                buildTextField("Message", "Type your message here....",
                    messageController,
                    maxLines: 3),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Text(
                  "We usually respond within 24 hours",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      sendEmail();
                    }
                  },
                  child: const Text(
                    "Send Email",
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint,
      TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          maxLines: maxLines,
          validator: (value) =>
          value!.isEmpty ? 'This field is required' : null,
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white54),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
