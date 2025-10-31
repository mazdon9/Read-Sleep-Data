import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_strings.dart';
import '../../core/constants/app_theme.dart';
import '../../core/di/service_locator.dart';
import '../../core/utils/date_formatter.dart';
import '../../data/models/sleep_session_model.dart';
import '../cubit/health_cubit.dart';
import '../widgets/error_message_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/primary_button.dart';

/// Main home screen that displays sleep data and handles permissions
/// This is the primary screen users see after the splash screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getDependency<HealthCubit>()..checkStatus(),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<HealthCubit>().refreshSleepData(),
          ),
        ],
      ),
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => context.read<HealthCubit>().refreshSleepData(),
            child: _buildContent(context, state),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, HealthState state) {
    if (state.isLoading) {
      return const Center(
        child: LoadingWidget(text: AppStrings.loadingSleepData),
      );
    }

    if (state.isError) {
      return ErrorMessageWidget(
        message: state.errorMessage ?? AppStrings.errorLoadingData,
        onRetry: () => context.read<HealthCubit>().checkStatus(),
        retryText: AppStrings.retry,
      );
    }

    if (state.shouldShowInstallButton) {
      return _buildInstallHealthConnect(context);
    }

    if (state.shouldShowPermissionRequest) {
      return _buildPermissionRequest(context);
    }

    if (state.shouldShowRetry) {
      // This handles both permission denied and other error states
      return _buildPermissionDenied(context);
    }

    if (!state.hasData && !state.isLoading && !state.isError) {
      return _buildNoData(context);
    }

    if (state.hasData) {
      return _buildSleepDataList(context, state.sleepSessions!);
    }

    // Fallback for any unhandled states
    return const Center(child: ErrorMessageWidget(message: 'Unknown state'));
  }

  Widget _buildInstallHealthConnect(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.download,
              size: AppDimensions.iconXL * 2,
              color: AppColors.warning,
            ),

            const SizedBox(height: AppDimensions.paddingL),

            const Text(
              AppStrings.healthConnectRequired,
              style: TextStyle(fontSize: 18, color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.paddingXL),

            PrimaryButton(
              text: AppStrings.healthConnectInstallButton,
              onPressed: () =>
                  context.read<HealthCubit>().openHealthConnectInstall(),
              icon: Icons.download,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionRequest(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.security,
              size: AppDimensions.iconXL * 2,
              color: AppColors.info,
            ),

            const SizedBox(height: AppDimensions.paddingL),

            const Text(
              'Permission Required',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.paddingM),

            const Text(
              'This app needs permission to access your sleep data from Health Connect to display your sleep patterns.',
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.paddingXL),

            PrimaryButton(
              text: 'Grant Permission',
              onPressed: () => context.read<HealthCubit>().requestPermission(),
              icon: Icons.check,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionDenied(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.block,
              size: AppDimensions.iconXL * 2,
              color: AppColors.error,
            ),

            const SizedBox(height: AppDimensions.paddingL),

            const Text(
              AppStrings.permissionDenied,
              style: TextStyle(fontSize: 18, color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.paddingXL),

            PrimaryButton(
              text: AppStrings.retryPermissionButton,
              onPressed: () => context.read<HealthCubit>().requestPermission(),
              icon: Icons.refresh,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoData(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bedtime_off,
              size: AppDimensions.iconXL * 2,
              color: AppColors.textHint,
            ),

            const SizedBox(height: AppDimensions.paddingL),

            const Text(
              AppStrings.noDataAvailable,
              style: TextStyle(fontSize: 18, color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.paddingM),

            const Text(
              'No sleep data found for the last 7 days. Make sure you have sleep tracking enabled in Health Connect.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppDimensions.paddingXL),

            PrimaryButton(
              text: 'Refresh',
              onPressed: () => context.read<HealthCubit>().refreshSleepData(),
              icon: Icons.refresh,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepDataList(
    BuildContext context,
    List<SleepSessionModel> sessions,
  ) {
    return CustomScrollView(
      slivers: [
        // Header section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.sleepDataTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: AppDimensions.paddingS),

                Text(
                  '${sessions.length} sleep sessions found',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Sleep sessions list
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final session = sessions[index];
            return _SleepSessionCard(session: session);
          }, childCount: sessions.length),
        ),

        // Bottom padding
        const SliverToBoxAdapter(
          child: SizedBox(height: AppDimensions.paddingL),
        ),
      ],
    );
  }
}

/// Individual sleep session card widget
class _SleepSessionCard extends StatelessWidget {
  final SleepSessionModel session;

  const _SleepSessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL,
        vertical: AppDimensions.paddingS,
      ),
      child: Card(
        elevation: AppDimensions.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date and duration row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateTimeFormatter.getRelativeDateString(session.startTime),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingS,
                      vertical: AppDimensions.paddingXS,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                    ),
                    child: Text(
                      DateTimeFormatter.formatDuration(session.duration),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppDimensions.paddingS),

              // Sleep time range
              Row(
                children: [
                  const Icon(
                    Icons.bedtime,
                    size: AppDimensions.iconS,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppDimensions.paddingXS),
                  Text(
                    DateTimeFormatter.formatSleepTimeRange(
                      session.startTime,
                      session.endTime,
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              // Source information if available
              if (session.source != null) ...[
                const SizedBox(height: AppDimensions.paddingXS),
                Row(
                  children: [
                    const Icon(
                      Icons.source,
                      size: AppDimensions.iconS,
                      color: AppColors.textHint,
                    ),
                    const SizedBox(width: AppDimensions.paddingXS),
                    Text(
                      session.source!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
