import 'package:get_it/get_it.dart';
import 'package:plant_app/core/network/network_manager.dart';
import 'package:plant_app/core/utils/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(getIt<SharedPreferences>()),
  );
}
