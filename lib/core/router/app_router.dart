import 'package:auto_route/auto_route.dart';
import 'package:plant_app/features/home/presentation/pages/home_page.dart';
import 'package:plant_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:plant_app/features/onboarding/presentation/pages/paywall_page.dart';
import 'package:plant_app/features/onboarding/presentation/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final bool isOnboardingCompleted;

  AppRouter({this.isOnboardingCompleted = false});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          initial: !isOnboardingCompleted,
        ),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: PaywallRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          initial: isOnboardingCompleted,
        ),
      ];
}
