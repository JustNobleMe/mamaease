import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'features/auth/screens/onboarding_screen.dart';
import 'features/auth/screens/login.dart';
import 'features/auth/screens/signup.dart';
import 'features/navigation/main_navigation.dart';
import 'package:myapp/features/navigation/edit_profile.dart';
import 'package:myapp/features/navigation/profile.dart';
import 'features/auth/screens/pregnancy_tracker.dart';
import 'features/doctors/screens/doctor_listing_screen.dart';
import 'features/doctors/screens/doctor_details_screen.dart';
import 'package:myapp/features/exercise/screens/exercise_screen.dart';
import 'features/doctors/screens/appointment_booking_screen.dart';
import 'features/doctors/screens/booking_success_screen.dart';
import 'package:myapp/features/midwives/screens/midwife_listing_screen.dart';
import 'package:myapp/features/midwives/screens/midwife_details_screen.dart';
import 'package:myapp/features/midwives/screens/book_midwife_screen.dart';
import 'package:myapp/features/marketplace/screens/marketplace_screen.dart';
import 'package:myapp/features/marketplace/screens/product_details_screen.dart';
import 'package:myapp/features/marketplace/screens/cart_screen.dart';
import 'package:myapp/features/marketplace/screens/order_confirmation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lato'),
      title: 'MamaEase',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const MainNavigationScreen(),
        '/pregnancy-tracker': (context) => const PregnancyTrackerScreen(),
        '/doctors': (context) => const DoctorListingScreen(),
        '/exercise': (context) => const ExerciseScreen(),
        '/doctor-details': (_) => const DoctorDetailsScreen(),
        '/book-appointment': (_) => const AppointmentBookingScreen(),
        '/booking-success': (_) => const BookingSuccessScreen(),
        '/midwives': (_) => const MidWivesScreen(),
        '/midwife-details': (_) => const MidwifeDetailsScreen(),
        '/book-midwife': (_) => const BookMidwifeScreen(),
        '/marketplace': (_) => const MarketplaceScreen(),
        '/product-details': (_) => const ProductDetailsScreen(),
        '/cart': (_) => const CartScreen(),
        '/order-confirmation': (_) => const OrderConfirmationScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/edit-profile': (_) => const EditProfileScreen(),
      },
    );
  }
}
