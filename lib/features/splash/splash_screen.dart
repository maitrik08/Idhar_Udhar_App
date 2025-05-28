import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  bool _startLogoAnimation = false;
  late AnimationController _textController;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();


    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _startLogoAnimation = true;
      });
    });

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    _textOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );

    Future.delayed(const Duration(milliseconds: 800), () {
      _textController.forward();
    });
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/dashboard'); // Change route as needed
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSlide(
                offset: _startLogoAnimation ? Offset.zero : const Offset(-1.5, 0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assets/images/Logo.png',
                  width: screenWidth * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: FadeTransition(
                  opacity: _textOpacityAnimation,
                  child: SlideTransition(
                    position: _textSlideAnimation,
                    child: Text(
                      'IdharUdhar',
                      style: TextStyle(
                        fontSize: screenWidth * 0.09,
                        fontFamily: 'inter',
                        color: AppColors.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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
