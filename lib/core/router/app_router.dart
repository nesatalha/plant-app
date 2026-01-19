import 'package:auto_route/auto_route.dart';
import 'package:plant_app/features/onboarding/presentation/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true),
      ];
}
