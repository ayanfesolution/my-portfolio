import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/utils/app_settings/injector.dart';
import 'package:portfolio/utils/local_keys.dart';

final getTheThemeData = StateNotifierProvider<GetTheThemeData, ThemeMode>(
  (ref) => GetTheThemeData(ThemeMode.system),
);

class GetTheThemeData extends StateNotifier<ThemeMode> {
  GetTheThemeData(super.state);

  getTheCurrentSystemTheme(BuildContext context) async {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    String theLastThemeMode =
        await injector.quickStorage.returnString(key: ObjectKeys.themeDate);

    if (theLastThemeMode == 'light') {
      state = ThemeMode.light;
    } else if (theLastThemeMode == 'dark') {
      state = ThemeMode.dark;
    } else {
      if (brightness == Brightness.dark) {
        state = ThemeMode.dark;
      } else {
        state = ThemeMode.light;
      }
    }
  }

  changeThemeMode() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
      injector.quickStorage
          .storeString(key: ObjectKeys.themeDate, data: 'light');
    } else {
      state = ThemeMode.dark;
      injector.quickStorage
          .storeString(key: ObjectKeys.themeDate, data: 'dark');
    }
  }
}
