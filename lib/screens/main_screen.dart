import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_state.dart';

/// Main screen that handles all the logic flow
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // Start the initialization process
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MainCubit>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Data Reader'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainInitial) {
            return const _InitialWidget();
          } else if (state is MainLoading) {
            return const _LoadingWidget();
          } else if (state is HealthConnectNotInstalled) {
            return _HealthConnectNotInstalledWidget(
              onInstallPressed: () => context.read<MainCubit>().openHealthConnectInPlayStore(),
              onRetryPressed: () => context.read<MainCubit>().retry(),
            );
          } else if (state is PermissionsNotGranted) {
            return _PermissionsNotGrantedWidget(
              onGrantPressed: () => context.read<MainCubit>().requestPermissions(),
              onRetryPressed: () => context.read<MainCubit>().retry(),
            );
          } else if (state is PermissionsDenied) {
            return _PermissionsDeniedWidget(
              onOpenHealthConnectPressed: () => context.read<MainCubit>().openHealthConnectApp(),
              onRetryPressed: () => context.read<MainCubit>().retry(),
            );
          } else if (state is SleepDataLoaded) {
            return _SleepDataWidget(
              sleepData: state.sleepData,
              onRefreshPressed: () => context.read<MainCubit>().loadSleepData(),
            );
          } else if (state is MainError) {
            return _ErrorWidget(
              message: state.message,
              onRetryPressed: () => context.read<MainCubit>().retry(),
            );
          } else {
            return const _InitialWidget();
          }
        },
      ),
    );
  }
}

/// Initial state widget
class _InitialWidget extends StatelessWidget {
  const _InitialWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bedtime, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Sleep Data Reader',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Initializing...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

/// Loading state widget
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading...'),
        ],
      ),
    );
  }
}

/// Health Connect not installed widget
class _HealthConnectNotInstalledWidget extends StatelessWidget {
  final VoidCallback onInstallPressed;
  final VoidCallback onRetryPressed;

  const _HealthConnectNotInstalledWidget({
    required this.onInstallPressed,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.health_and_safety, size: 64, color: Colors.orange),
            const SizedBox(height: 16),
            const Text(
              'Health Connect Required',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This app requires Health Connect to read sleep data. Please install it from the Play Store.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onInstallPressed,
              icon: const Icon(Icons.download),
              label: const Text('Install Health Connect'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: onRetryPressed,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Permissions not granted widget
class _PermissionsNotGrantedWidget extends StatelessWidget {
  final VoidCallback onGrantPressed;
  final VoidCallback onRetryPressed;

  const _PermissionsNotGrantedWidget({
    required this.onGrantPressed,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.security, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'Permissions Required',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'We need permission to read your sleep data from Health Connect.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onGrantPressed,
              icon: const Icon(Icons.check),
              label: const Text('Grant Permissions'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: onRetryPressed,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Permissions denied widget
class _PermissionsDeniedWidget extends StatelessWidget {
  final VoidCallback onOpenHealthConnectPressed;
  final VoidCallback onRetryPressed;

  const _PermissionsDeniedWidget({
    required this.onOpenHealthConnectPressed,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.block, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Permissions Denied',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sleep data permissions were denied. Please open Health Connect and grant permissions manually.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onOpenHealthConnectPressed,
              icon: const Icon(Icons.settings),
              label: const Text('Open Health Connect'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: onRetryPressed,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Sleep data display widget
class _SleepDataWidget extends StatelessWidget {
  final List<HealthDataPoint> sleepData;
  final VoidCallback onRefreshPressed;

  const _SleepDataWidget({
    required this.sleepData,
    required this.onRefreshPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.green.shade50,
          child: Column(
            children: [
              const Icon(Icons.bedtime, size: 48, color: Colors.green),
              const SizedBox(height: 8),
              const Text(
                'Sleep Data (Last 7 Days)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                '${sleepData.length} entries found',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: onRefreshPressed,
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
        // Data list
        Expanded(
          child: sleepData.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No Sleep Data Found',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Make sure you have sleep data in Health Connect for the last 7 days.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: sleepData.length,
                  itemBuilder: (context, index) {
                    final dataPoint = sleepData[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          _getIconForSleepType(dataPoint.type),
                          color: _getColorForSleepType(dataPoint.type),
                        ),
                        title: Text(_getSleepTypeName(dataPoint.type)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From: ${_formatDateTime(dataPoint.dateFrom)}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              'To: ${_formatDateTime(dataPoint.dateTo)}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Value: ${dataPoint.value} ${dataPoint.unit}',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  IconData _getIconForSleepType(HealthDataType type) {
    switch (type) {
      case HealthDataType.SLEEP_SESSION:
        return Icons.bedtime;
      case HealthDataType.SLEEP_ASLEEP:
        return Icons.nightlight;
      case HealthDataType.SLEEP_AWAKE:
        return Icons.light_mode;
      case HealthDataType.SLEEP_DEEP:
        return Icons.nights_stay;
      case HealthDataType.SLEEP_LIGHT:
        return Icons.brightness_3;
      case HealthDataType.SLEEP_REM:
        return Icons.visibility;
      case HealthDataType.SLEEP_IN_BED:
        return Icons.bed;
      default:
        return Icons.bedtime;
    }
  }

  Color _getColorForSleepType(HealthDataType type) {
    switch (type) {
      case HealthDataType.SLEEP_SESSION:
        return Colors.blue;
      case HealthDataType.SLEEP_ASLEEP:
        return Colors.indigo;
      case HealthDataType.SLEEP_AWAKE:
        return Colors.orange;
      case HealthDataType.SLEEP_DEEP:
        return Colors.purple;
      case HealthDataType.SLEEP_LIGHT:
        return Colors.cyan;
      case HealthDataType.SLEEP_REM:
        return Colors.green;
      case HealthDataType.SLEEP_IN_BED:
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  String _getSleepTypeName(HealthDataType type) {
    switch (type) {
      case HealthDataType.SLEEP_SESSION:
        return 'Sleep Session';
      case HealthDataType.SLEEP_ASLEEP:
        return 'Asleep';
      case HealthDataType.SLEEP_AWAKE:
        return 'Awake';
      case HealthDataType.SLEEP_DEEP:
        return 'Deep Sleep';
      case HealthDataType.SLEEP_LIGHT:
        return 'Light Sleep';
      case HealthDataType.SLEEP_REM:
        return 'REM Sleep';
      case HealthDataType.SLEEP_IN_BED:
        return 'Time in Bed';
      default:
        return type.toString().split('.').last;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

/// Error state widget
class _ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetryPressed;

  const _ErrorWidget({
    required this.message,
    required this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              'Error Occurred',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetryPressed,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}