import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';

import '../../core/constants/app_strings.dart';
import '../../core/constants/app_theme.dart';
import '../../core/utils/date_formatter.dart';
import '../../services/health_service.dart';
import '../cubit/health_cubit.dart';
import '../widgets/error_message_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/primary_button.dart';

/// Main home screen that displays sleep data and handles permissions
/// This is the primary screen users see after the splash screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final HealthCubit _cubit;
  Timer? _autoRefreshTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cubit = HealthCubit(HealthService());
    // initial check
    _cubit.checkStatus();
    // Start auto-refresh timer - check for new data every 5 minutes
    _startAutoRefreshTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _autoRefreshTimer?.cancel();
    _cubit.close();
    super.dispose();
  }

  /// Start timer to automatically refresh data every 5 minutes
  void _startAutoRefreshTimer() {
    _autoRefreshTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      // Only refresh if we have data loaded (not in permission or error states)
      final currentState = _cubit.state;
      if (currentState.hasData && !currentState.isLoading) {
        print('Debug: Auto-refreshing sleep data...');
        _cubit.refreshSleepData();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // When returning from Health Connect app, re-check permissions/data
      _cubit.checkStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: _cubit, child: const _HomeScreenView());
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          AppStrings.appTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.info,
        foregroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          return _buildContent(context, state);
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

            // Request permission via system dialog
            PrimaryButton(
              // 60% của màn hình
              text: 'Grant Permission',
              onPressed: () => context.read<HealthCubit>().requestPermission(),
              icon: Icons.security,
            ),

            const SizedBox(height: AppDimensions.paddingM),

            // Alternative: Open Health Connect button
            OutlinedButton.icon(
              onPressed: () async {
                final healthService = HealthService();
                await healthService.openHealthConnectApp();
              },
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open Health Connect'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                  vertical: AppDimensions.paddingM,
                ),
              ),
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

            // Retry Permission button as required
            PrimaryButton(
              text: AppStrings.retryPermissionButton,
              onPressed: () => context.read<HealthCubit>().requestPermission(),
              icon: Icons.refresh,
            ),

            const SizedBox(height: AppDimensions.paddingM),

            // Alternative: Open Health Connect button
            OutlinedButton.icon(
              onPressed: () async {
                final healthService = HealthService();
                await healthService.openHealthConnectApp();
              },
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open Health Connect'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingL,
                  vertical: AppDimensions.paddingM,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoData(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 300));
        context.read<HealthCubit>().refreshSleepData();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
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
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppDimensions.paddingM),

                  const Text(
                    'No sleep data found for the last 7 days. Make sure you have sleep tracking enabled in Health Connect.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppDimensions.paddingM),

                  const Text(
                    'Pull down to refresh or tap the button below',
                    style: TextStyle(fontSize: 12, color: AppColors.textHint),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppDimensions.paddingXL),

                  PrimaryButton(
                    text: 'Refresh',
                    onPressed: () =>
                        context.read<HealthCubit>().refreshSleepData(),
                    icon: Icons.refresh,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSleepDataList(
    BuildContext context,
    List<HealthDataPoint> sessions,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        // Show loading state briefly for user feedback
        await Future.delayed(const Duration(milliseconds: 300));
        context.read<HealthCubit>().refreshSleepData();
      },
      child: CustomScrollView(
        physics:
            const AlwaysScrollableScrollPhysics(), // Ensure pull-to-refresh works even with little content
        slivers: [
          // Header section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.paddingM,
                AppDimensions.paddingL,
                AppDimensions.paddingL,
                AppDimensions.paddingXS,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.sleepDataTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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

                  const SizedBox(height: AppDimensions.paddingS),

                  // Auto-refresh indicator and last updated time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.auto_mode,
                            size: 16,
                            color: AppColors.textHint,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Auto-refresh every 5 minutes',
                            style: TextStyle(
                              color: AppColors.textHint,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Last updated time
                      BlocBuilder<HealthCubit, HealthState>(
                        builder: (context, state) {
                          final lastUpdated = state.lastUpdated;
                          if (lastUpdated != null) {
                            return Row(
                              children: [
                                Icon(
                                  Icons.update,
                                  size: 16,
                                  color: AppColors.textHint,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Last updated: ${DateTimeFormatter.formatTime(lastUpdated)}',
                                  style: TextStyle(
                                    color: AppColors.textHint,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
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
      ),
    );
  }
}

/// Individual sleep session card widget
class _SleepSessionCard extends StatelessWidget {
  final HealthDataPoint session;

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
                    DateTimeFormatter.getRelativeDateString(session.dateFrom),
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
                      DateTimeFormatter.formatDuration(
                        session.dateTo.difference(session.dateFrom),
                      ),
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
                      session.dateFrom,
                      session.dateTo,
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              // Source information if available
              if (session.sourceName.isNotEmpty) ...[
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
                      _formatSourceName(session.sourceName),
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

  /// Format source name to be more user-friendly
  String _formatSourceName(String sourceName) {
    if (sourceName.contains('com.google.android.apps.fitness')) {
      return 'Google Fit';
    } else if (sourceName.contains('com.google.android.apps.healthdata')) {
      return 'Health Connect';
    } else if (sourceName.contains('samsung.health')) {
      return 'Samsung Health';
    } else if (sourceName.contains('fitbit')) {
      return 'Fitbit';
    } else if (sourceName.contains('garmin')) {
      return 'Garmin';
    } else if (sourceName.contains('huawei.health')) {
      return 'Huawei Health';
    } else {
      // Return a capitalized version of the source name
      return sourceName.split('.').last.replaceAll('_', ' ').toUpperCase();
    }
  }
}
