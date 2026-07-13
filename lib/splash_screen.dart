import 'package:flutter/material.dart';
import 'package:myapp/app_colors.dart';
import 'package:myapp/constants/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    // Keep splash visible for a few seconds
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    try {
      final loggedIn = await _authService.isLoggedIn();

      if (!mounted) return;

      if (loggedIn) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/onboarding',
          (route) => false,
        );
      }
    } catch (e) {
      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/onboarding',
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),

              Image.asset(
                'assets/images/logo.png',
                height: 120,
                width: 120,
              ),

              const SizedBox(height: 8),

              const Text(
                'MamaEase',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Your Trusted Pregnancy Companion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40),

              const CircularProgressIndicator(),

              const Spacer(),

              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
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