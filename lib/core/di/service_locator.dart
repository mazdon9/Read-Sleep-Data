import 'package:get_it/get_it.dart';
import '../../services/health_service.dart';
import '../../cubit/main_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register services
  getIt.registerSingleton<HealthService>(HealthService());

  // Register BLoCs/Cubits
  getIt.registerFactory<MainCubit>(
    () => MainCubit(getIt<HealthService>()),
  );
}
