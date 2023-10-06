import 'package:go_router/go_router.dart';
import 'package:ms_ecommerce_app/features/landing_screen.dart';
import 'package:ms_ecommerce_app/splash.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingScreen(),
    ),
  ],
);
