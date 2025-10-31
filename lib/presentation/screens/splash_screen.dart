import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_theme.dart';
import '../../core/di/service_locator.dart';
import '../cubit/splash_cubit.dart';
import '../widgets/loading_widget.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';

/// Splash screen that appears when the app starts
/// Handles initial Health Connect status check and navigation
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getDependency<SplashCubit>()..initialize(),
      child: const _SplashScreenView(),
    );
  }
}

class _SplashScreenView extends StatelessWidget {
  const _SplashScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          // Navigate to home screen when ready
          if (state.shouldNavigateToHome) {
            _navigateToHome(context);
          }
          // Navigate to home screen for permission request handling
          else if (state.shouldRequestPermission) {
            _navigateToHome(context);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo/icon
                  const _AppLogo(),

                  const SizedBox(height: AppDimensions.paddingXL),

                  // App title
                  Text(
                    AppStrings.appTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppDimensions.paddingXL),

                  // Content based on state
                  Expanded(child: _buildContent(context, state)),

                  // Bottom action buttons
                  _buildActionButtons(context, state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, SplashState state) {
    if (state.isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingWidget(),
          SizedBox(height: AppDimensions.paddingM),
          Text(
            AppStrings.loading,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Status icon
        _buildStatusIcon(state),

        const SizedBox(height: AppDimensions.paddingL),

        // Status message
        Text(
          state.message,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStatusIcon(SplashState state) {
    IconData iconData;
    Color iconColor;

    switch (state) {
      case SplashState.healthConnectNotInstalled:
        iconData = Icons.download;
        iconColor = AppColors.warning;
        break;
      case SplashState.healthConnectNotSupported:
        iconData = Icons.error_outline;
        iconColor = AppColors.error;
        break;
      case SplashState.needsPermission:
        iconData = Icons.security;
        iconColor = AppColors.info;
        break;
      case SplashState.ready:
        iconData = Icons.check_circle;
        iconColor = AppColors.success;
        break;
      case SplashState.error:
        iconData = Icons.error;
        iconColor = AppColors.error;
        break;
      case SplashState.loading:
        iconData = Icons.hourglass_empty;
        iconColor = AppColors.primary;
        break;
    }

    return Icon(iconData, size: AppDimensions.iconXL * 2, color: iconColor);
  }

  Widget _buildActionButtons(BuildContext context, SplashState state) {
    final buttons = <Widget>[];

    if (state.shouldShowInstallButton) {
      buttons.add(
        PrimaryButton(
          text: AppStrings.healthConnectInstallButton,
          onPressed: () => _openHealthConnectInstall(),
          icon: Icons.download,
        ),
      );
    }

    if (state.shouldShowRetryButton) {
      buttons.add(
        PrimaryButton(
          text: AppStrings.retry,
          onPressed: () => context.read<SplashCubit>().retry(),
          icon: Icons.refresh,
        ),
      );
    }

    if (buttons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        ...buttons
            .map(
              (button) => [
                button,
                const SizedBox(height: AppDimensions.paddingM),
              ],
            )
            .expand((widgets) => widgets)
            .toList()
          ..removeLast(), // Remove last spacing
      ],
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Future<void> _openHealthConnectInstall() async {
    try {
      final uri = Uri.parse(HealthConnectConstants.healthConnectPlayStoreUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (error) {
      // Handle error silently or show a snackbar
    }
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
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.bedtime,
        size: AppDimensions.iconXL * 1.5,
        color: AppColors.surface,
      ),
    );
  }
}
