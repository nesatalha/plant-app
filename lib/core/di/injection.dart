import 'package:get_it/get_it.dart';
import 'package:plant_app/core/network/network_manager.dart';
import 'package:plant_app/core/utils/shared_preferences_service.dart';
import 'package:plant_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plant_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:plant_app/features/home/domain/repositories/home_repository.dart';
import 'package:plant_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(getIt<SharedPreferences>()),
  );

  // Home Feature
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(networkManager: getIt<NetworkManager>()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt<HomeRemoteDataSource>()),
  );
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(homeRepository: getIt<HomeRepository>()),
  );
}
