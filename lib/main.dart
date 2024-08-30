import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/utils/routes.dart';
import 'package:portfolio/utils/theme_data.dart';
import 'providers/system_setup/theme_data_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  initialAction() async {
    ref.watch(getTheThemeData.notifier).getTheCurrentSystemTheme(context);
  }

  @override
  void didChangeDependencies() {
    initialAction();
    setState(() {});
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    // final palette = context.watch<Palette>();
    return MaterialApp.router(
      title: 'NinjaUpdates',
      theme: MyPortfolioUpdateThemeData.lightMode,
      darkTheme: MyPortfolioUpdateThemeData.darkMode,
      themeMode: themeMode,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
