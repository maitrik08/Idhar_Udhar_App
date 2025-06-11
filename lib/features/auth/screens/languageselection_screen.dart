import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _selectBoxKey = GlobalKey();

  final List<String> languages = [
    'English', 'Hindi', 'Gujarati', 'Punjabi', 'Sanskrit',
    'Marathi', 'Kashmiri', 'Sindhi', 'Tamil', 'Telugu',
    'Urdu', 'Nepali', 'Bengali', 'Malayalam', 'Japanese'
  ];

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _selectBoxKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 4,
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, size.height + 4),
          showWhenUnlinked: false,
          child: Material(
            elevation: 8,
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(ButtonBorderRadius),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: languages.length,
                separatorBuilder: (_, __) => const Divider(
                  color: Colors.white24,
                  height: 1,
                  thickness: 0.5,
                  indent: 12,
                  endIndent: 12,
                ),
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = lang == selectedLanguage;

                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedLanguage = lang;
                          _toggleDropdown(); // Close the dropdown
                        });
                      },
                      child: Container(
                        color: isSelected ? AppColors.primary : Colors.transparent, // Background color here
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: Text(
                          lang,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white, // Keep text white
                            fontSize: 14,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }

              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (_overlayEntry != null) {
              _toggleDropdown(); // close dropdown if open
            }
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.08),

                    Text(
                      "Choose Your Language",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.02),

                    Text(
                      "Please select your preferred language to continue. You can change it anytime from settings.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: width * 0.035,
                      ),
                    ),
                    SizedBox(height: height * 0.12),

                    CompositedTransformTarget(
                      link: _layerLink,
                      child: GestureDetector(
                        onTap: _toggleDropdown,
                        child: Container(
                          key: _selectBoxKey,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(ButtonBorderRadius),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                selectedLanguage ?? "Select Language",
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      width: double.infinity,
                      height: height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedLanguage != null) {
                            Navigator.pushNamed(context, '/gender');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a language'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ButtonBorderRadius),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: selectedLanguage != null ? Colors.white : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account ? ",
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
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
