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
import 'package:idhar_udhar/features/ride/auto/chatauto_screen.dart';
import 'package:idhar_udhar/features/ride/auto/confirmautopickup_screen.dart';
import 'package:idhar_udhar/features/ride/auto/confirmmapauto.dart';
import 'package:idhar_udhar/features/ride/auto/noautodriver_screen.dart';
import 'package:idhar_udhar/features/ride/auto/selectautolocation_screen.dart';
import 'package:idhar_udhar/features/ride/bike/bookbike_screen.dart';
import 'package:idhar_udhar/features/ride/bike/confirmmap_screen.dart';
import 'package:idhar_udhar/features/ride/bike/nodriver_screen.dart';
import 'package:idhar_udhar/features/ride/car/ConfirmMapWrapperScreen.dart';
import 'package:idhar_udhar/features/ride/car/bookcar_screen.dart';
import 'package:idhar_udhar/features/ride/car/chatcar_screen.dart';
import 'package:idhar_udhar/features/ride/car/confirmcarpickup_screen.dart';
import 'package:idhar_udhar/features/ride/car/nocardriver_screen.dart';
import 'package:idhar_udhar/features/ride/car/searchcardriver_screen.dart';
import 'package:idhar_udhar/features/ride/car/selectcarlocation_screen.dart';
import 'package:idhar_udhar/features/splash/dashboard_screen.dart';

// Import screens
import '../features/home/home_screen.dart';
import '../features/mainlayout.dart';
import '../features/payment/allpaymentmethods.dart';
import '../features/payment/confirmcreditcardpayment.dart';
import '../features/payment/creditcardpayment.dart';
import '../features/ride/auto/searchautodriver_screen.dart';
import '../features/ride/bike/chatbike_screen.dart';
import '../features/ride/bike/confirmpickup_screen.dart';
import '../features/ride/bike/searchdriver_screen.dart';
import '../features/ride/bike/selectbikelocation_screen.dart';
import '../features/ride/mainRide_screen.dart';
import '../features/splash/splash_screen.dart';

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
  static const String nobikedriver = '/nobikedriver';
  static const String confirmmapbike = '/confirmmapbike';
  static const String chatbikedriver = '/chatbikedriver';

  static const String selectautolocation = '/selectautolocation';
  static const String bookauto = '/bookauto';
  static const String searchautodriver = '/searchautodriver';
  static const String confirmautorpickup = '/confirmautorpickup';
  static const String paymentmethodauto = '/paymentmethodauto';
  static const String creditcardpaymentauto = '/creditcardpaymentauto';
  static const String confirmpaymentauto= '/confirmpaymentauto';
  static const String noautodriver= '/noautodriver';
  static const String chatautodriver= '/chatautodriver';
  static const String confirmmapauto = '/confirmmapauto';


  static const String selectcarlocation = '/selectcarlocation';
  static const String bookcar = '/bookcar';
  static const String searchcardriver = '/searchcardriver';
  static const String confirmcarpickup = '/confirmcarpickup';
  static const String paymentmethodcar = '/paymentmethodcar';
  static const String creditcardpaymentcar = '/creditcardpaymentcar';
  static const String confirmpaymentcar= '/confirmpaymentcar';
  static const String nocardriver= '/nocardriver';
  static const String chatcardriver= '/chatcardriver';
  static const String confirmmapcar = '/confirmmapcar';


  static const String paymentmethod= '/paymentmethod';
  static const String creditcardpayment= '/creditcardpayment';
  static const String confirmcardpayment= '/confirmcardpayment';


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
    nobikedriver: (context) => NoDriverScreen(),
    confirmbikrpickup: (context) => ConfirmBikePickupScreen(),
    confirmmapbike: (context)=> ConfirmMapWrapperScreen(),
    chatbikedriver: (context)=> ChatBikeScreen(),

    selectautolocation: (context) => SelectAutoLocationScreen(),
    bookauto: (context) => BookAutoScreen(),
    searchautodriver: (context) => SearchingAutoDriverScreen(),
    confirmautorpickup: (context) => ConfirmAutoPickupScreen(),
    noautodriver: (context)=> NoAutoDriverScreen(),
    chatautodriver: (context)=> ChatAutoScreen(),
    confirmmapauto: (context)=> ConfirmAutoMapWrapperScreen(),


    selectcarlocation: (context) => SelectcarLocationScreen(),
    bookcar: (context) => BookCarScreen(),
    searchcardriver: (context) => SearchingCarDriverScreen(),
    confirmcarpickup: (context) => ConfirmCarPickupScreen(),
    nocardriver: (context)=> NoCarDriverScreen(),
    chatcardriver: (context)=> ChatCarScreen(),
    confirmmapcar : (context)=> ConfirmCarMapWrapperScreen(),

    paymentmethod: (context) => PaymentMethodScreen(),
    creditcardpayment: (context) => CreditCardPaymentScreen(),
    confirmcardpayment: (context) => ConfirmcardPaymentScreen(),


  };
}
