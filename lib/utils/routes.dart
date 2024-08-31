import 'package:go_router/go_router.dart';
import 'package:portfolio/screens/portfolio/all_portfolio.dart';
import 'package:portfolio/screens/portfolio/portfolio.dart';
import 'package:portfolio/screens/onboarding/splash_screen.dart';
import 'package:portfolio/utils/app_settings/injector.dart';
import 'package:portfolio/utils/transition.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/app',
    ),
    GoRoute(
      path: '/app',
      builder: (context, state) => const SplashScreen(
          // key: Key('main menu'),
          ),
      routes: const [],
    ),
    GoRoute(
      path: '/portfolio',
      pageBuilder: (context, state) => buildMyTransition<void>(
        // key: const ValueKey('onboarding'),
        color: injector.palette.primaryColor,
        child: const Portfolio(),
      ),
    ),
  ],
);
