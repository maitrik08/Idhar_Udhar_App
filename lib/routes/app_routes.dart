import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/auth/screens/allowlocation.dart';
import 'package:idhar_udhar/features/auth/screens/gender_screen.dart';
import 'package:idhar_udhar/features/auth/screens/languageselection_screen.dart';
import 'package:idhar_udhar/features/auth/screens/locationpermission_screen.dart';
import 'package:idhar_udhar/features/auth/screens/login&signup_screen.dart';
import 'package:idhar_udhar/features/auth/screens/login_screen.dart';
import 'package:idhar_udhar/features/auth/screens/otp_screen.dart';
import 'package:idhar_udhar/features/auth/screens/signup_screen.dart';
import 'package:idhar_udhar/features/delivery/maindelivery_screen.dart';
import 'package:idhar_udhar/features/ride/auto/bookauto_screen.dart';
import 'package:idhar_udhar/features/ride/auto/selectautolocation_screen.dart';
import 'package:idhar_udhar/features/ride/bike/bookbike_screen.dart';
import 'package:idhar_udhar/features/ride/bike/creditcardpayment_screen.dart';
import 'package:idhar_udhar/features/ride/car/bookcar_screen.dart';
import 'package:idhar_udhar/features/ride/car/selectcarlocation_screen.dart';
import 'package:idhar_udhar/features/splash/dashboard_screen.dart';

// Import screens
import '../features/home/home_screen.dart';
import '../features/mainlayout.dart';
import '../features/ride/bike/confirmpayment_screen.dart';
import '../features/ride/bike/confirmpickup_screen.dart';
import '../features/ride/bike/paymentmethods_screen.dart';
import '../features/ride/bike/searchdriver_screen.dart';
import '../features/ride/bike/selectbikelocation_screen.dart';
import '../features/ride/mainRide_screen.dart';
import '../features/splash/splash_screen.dart';
// import '../features/auth/screens/login_screen.dart';
// import '../features/user/home/user_home_screen.dart';
// import '../features/user/ride_booking/ride_request_screen.dart';
// import '../features/user/history/user_history_screen.dart';
// import '../features/user/profile/user_profile_screen.dart';

//import '../features/driver/dashboard/driver_home_screen.dart';
// import '../features/driver/trip_requests/trip_request_screen.dart';
// import '../features/driver/earnings/driver_earnings_screen.dart';
// import '../features/driver/profile/driver_profile_screen.dart';
//
// import '../features/admin/dashboard/admin_dashboard_screen.dart';
// import '../features/admin/manage_users/manage_users_screen.dart';
// import '../features/admin/manage_drivers/manage_drivers_screen.dart';
// import '../features/admin/reports/reports_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String loginsignup = '/loginsignup';
  static const String dashboard = '/dashboard';
  static const String signup = '/signup';
  static const String languageselection = '/languageselection';
  static const String otp = '/otpscreen';
  static const String locationaccess = '/locationaccess';
  static const String allowlocation = '/allowlocation';
  static const String gender = '/gender';

  // User
  static const String home = '/home/homescreen';
  static const String ride = '/ride';
  static const String profile = '/profile';
  static const String delivery = '/delivery';
  static const String layout = '/layout';


  static const String selectbikelocation = '/selectbikelocation';
  static const String bookbike = '/bookbike';
  static const String searchbikedriver = '/searchbikedriver';
  static const String confirmbikrpickup = '/confirmbikrpickup';
  static const String paymentmethodbike = '/paymentmethodbike';
  static const String creditcardpaymentbike = '/creditcardpaymentbike';
  static const String confirmpaymentbike = '/confirmpaymentbike';

  static const String selectautolocation = '/selectautolocation';
  static const String bookauto = '/bookauto';
  static const String searchautodriver = '/searchautodriver';
  static const String confirmautorpickup = '/confirmautorpickup';
  static const String paymentmethodauto = '/paymentmethodauto';
  static const String creditcardpaymentauto = '/creditcardpaymentauto';
  static const String confirmpaymentauto= '/confirmpaymentauto';


  static const String selectcarlocation = '/selectcarlocation';
  static const String bookcar = '/bookcar';
  static const String searchcardriver = '/searchcardriver';
  static const String confirmcarpickup = '/confirmcarpickup';
  static const String paymentmethodcar = '/paymentmethodcar';
  static const String creditcardpaymentcar = '/creditcardpaymentcar';
  static const String confirmpaymentcar= '/confirmpaymentcar';


  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    dashboard: (context) => DashboardScreen(),
    loginsignup: (context) => LoginSignupScreen(),
    login: (context) => LoginScreen(),
    otp: (context) => OTPScreen(),
    signup: (context) => SignupScreen(),
    languageselection: (context) => LanguageSelectionScreen(),
    locationaccess: (context) => LocationAccessScreen(),
    gender: (context) => GenderScreen(),
    allowlocation: (context) => AllowLocationScreen(),
    ride: (context) => RideScreen(),
    layout: (context) => MainLayout(),
    delivery: (context) => DeliveryScreen(),


    //
    // // User
    home: (context) => HomeScreen(),


    selectbikelocation: (context) => SelectBikeLocationScreen(),
    bookbike: (context) => BookBikeScreen(),
    searchbikedriver: (context) => SearchingBikeDriverScreen(),
    confirmbikrpickup: (context) => ConfirmBikePickupScreen(),
    paymentmethodbike: (context) => PaymentMethodBikeScreen(),
    creditcardpaymentbike: (context)=> CreditCardPaymentBikeScreen(),
    confirmpaymentbike: (context)=> ConfirmPaymentBIKEScreen(),

    selectautolocation: (context) => SelectAutoLocationScreen(),
    bookauto: (context) => BookAutoScreen(),
    searchautodriver: (context) => SearchingBikeDriverScreen(),
    confirmautorpickup: (context) => ConfirmBikePickupScreen(),
    paymentmethodauto: (context) => PaymentMethodBikeScreen(),
    creditcardpaymentauto: (context)=> CreditCardPaymentBikeScreen(),
    confirmpaymentauto: (context)=> ConfirmPaymentBIKEScreen(),


    selectcarlocation: (context) => SelectcarLocationScreen(),
    bookcar: (context) => BookCarScreen(),
    searchcardriver: (context) => SearchingBikeDriverScreen(),
    confirmcarpickup: (context) => ConfirmBikePickupScreen(),
    paymentmethodcar: (context) => PaymentMethodBikeScreen(),
    creditcardpaymentcar: (context)=> CreditCardPaymentBikeScreen(),
    confirmpaymentcar: (context)=> ConfirmPaymentBIKEScreen()


    // rideRequest: (context) => RideRequestScreen(),
    // userHistory: (context) => UserHistoryScreen(),
    // userProfile: (context) => UserProfileScreen(),
  };
}
