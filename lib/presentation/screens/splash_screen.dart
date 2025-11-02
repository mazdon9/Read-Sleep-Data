import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/constants/app_theme.dart';
import 'home_screen.dart';

/// Splash screen that appears when the app starts
/// Shows app logo and automatically navigates to home screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home screen after 2 seconds
    // Slightly longer splash for branding (3 seconds)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingL,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // App logo/icon
                const _AppLogo(),

                const SizedBox(height: AppDimensions.paddingL),

                // App title
                Text(
                  AppStrings.appTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppDimensions.paddingL),

                // Small loading indicator below the title
                const SizedBox(height: AppDimensions.paddingM),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// App logo widget for the splash screen
class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        child: Image.asset(
          'assets/images/logo_images.jpg',
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
