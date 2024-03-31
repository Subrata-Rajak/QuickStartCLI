import 'package:arimart/core/routes/route_names.dart';
import 'package:arimart/core/routes/route_paths.dart';
import 'package:arimart/features/splash/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static AppRoutes instance = AppRoutes();

  final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: AppRoutePaths.instance.splashScreenRoutePath,
      name: AppRouteNames.instance.splashScreenRouteName,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
  ], initialLocation: AppRoutePaths.instance.splashScreenRoutePath);
}
