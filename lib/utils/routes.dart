import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/homepage.dart';
import 'package:portfolio/pages/splash_screen.dart';
import 'package:portfolio/utils/injector.dart';
import 'package:portfolio/utils/my_transition.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/index',
    ),
    GoRoute(
      path: '/index',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => buildMyTransition(
        child: const HomePageScreen(),
        color: injector.palette.backgroundSettings,
      ),
      //builder: (context, state) => const HomePageScreen(),
      routes: const [],
    ),
  ],
);
