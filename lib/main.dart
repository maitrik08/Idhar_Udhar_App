import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/splash/splash_screen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IdharUdhar App',
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      theme: ThemeData.dark(),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
