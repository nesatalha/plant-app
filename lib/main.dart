import 'package:flutter/material.dart';

import 'core/di/injection.dart' as di;
import 'core/router/app_router.dart';
import 'core/utils/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencyInjection();

  final sharedPreferencesService = di.getIt<SharedPreferencesService>();
  final isOnboardingCompleted = await sharedPreferencesService.isOnboardingCompleted();

  runApp(MyApp(isOnboardingCompleted: isOnboardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool isOnboardingCompleted;

  const MyApp({
    super.key,
    required this.isOnboardingCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(isOnboardingCompleted: isOnboardingCompleted);

    return MaterialApp.router(
      title: 'Plant App',
      routerConfig: appRouter.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
