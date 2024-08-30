import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/providers/system_setup/theme_data_provider.dart';
import 'package:portfolio/utils/app_settings/injector.dart';
import 'package:portfolio/utils/extension/auto_resize.dart';
import 'package:rive/rive.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    initialAction();
    super.initState();
  }

  Future<Timer> initialAction() async {
    // ref.read(apiKey.notifier).getApiKey();
    return Timer(
      const Duration(seconds: 3),
      () async {
        context.go(
          '/portfolio',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 250,
              width: 250,
              child: RiveAnimation.asset(
                'assets/loading.riv',
              ),
            ),
            Text(
              'Loading...',
              style: GoogleFonts.playfair(
                color: (themeMode == ThemeMode.dark)
                    ? injector.palette.pureWhite
                    : injector.palette.textColor,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
