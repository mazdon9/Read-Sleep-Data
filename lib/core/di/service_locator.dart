import 'package:get_it/get_it.dart';

import '../../data/datasources/health_data_source.dart';
import '../../data/repositories/health_repository_impl.dart';
import '../../domain/repositories/health_repository.dart';
import '../../domain/usecases/check_health_connect_status.dart';
import '../../domain/usecases/get_sleep_data.dart';
import '../../domain/usecases/request_permission.dart';
import '../../presentation/cubit/health_cubit.dart';
import '../../presentation/cubit/splash_cubit.dart';

/// Service locator using GetIt for dependency injection
/// Configures all dependencies for the application following clean architecture
final GetIt serviceLocator = GetIt.instance;

/// Initialize all dependencies
/// Call this method once at app startup before runApp()
Future<void> initializeDependencies() async {
  // Register data sources as singletons
  // These manage external APIs and should persist throughout app lifecycle
  serviceLocator.registerSingleton<HealthDataSource>(HealthDataSourceImpl());

  // Register repositories as singletons
  // Repositories coordinate between domain and data layers
  serviceLocator.registerSingleton<HealthRepository>(
    HealthRepositoryImpl(dataSource: serviceLocator<HealthDataSource>()),
  );

  // Register use cases as factories
  // Use cases contain business logic and are created fresh for each operation
  serviceLocator.registerFactory<CheckHealthConnectStatus>(
    () => CheckHealthConnectStatus(
      repository: serviceLocator<HealthRepository>(),
    ),
  );

  serviceLocator.registerFactory<RequestPermission>(
    () => RequestPermission(repository: serviceLocator<HealthRepository>()),
  );

  serviceLocator.registerFactory<GetSleepData>(
    () => GetSleepData(repository: serviceLocator<HealthRepository>()),
  );

  // Register Cubits as lazy singletons
  // Cubits manage state and should persist but only be created when needed
  serviceLocator.registerLazySingleton<SplashCubit>(
    () => SplashCubit(
      checkHealthConnectStatus: serviceLocator<CheckHealthConnectStatus>(),
    ),
  );

  serviceLocator.registerLazySingleton<HealthCubit>(
    () => HealthCubit(
      requestPermission: serviceLocator<RequestPermission>(),
      getSleepData: serviceLocator<GetSleepData>(),
      checkHealthConnectStatus: serviceLocator<CheckHealthConnectStatus>(),
    ),
  );
}

/// Reset all dependencies (useful for testing)
/// Clears the service locator and re-initializes all dependencies
Future<void> resetDependencies() async {
  await serviceLocator.reset();
  await initializeDependencies();
}

/// Get a dependency from the service locator
/// Generic helper method for cleaner dependency access
T getDependency<T extends Object>() {
  return serviceLocator<T>();
}

/// Check if a dependency is registered
/// Useful for conditional registration or testing
bool isDependencyRegistered<T extends Object>() {
  return serviceLocator.isRegistered<T>();
}
