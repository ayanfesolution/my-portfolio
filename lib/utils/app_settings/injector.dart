
import 'package:portfolio/utils/app_settings/palette.dart';
import 'package:portfolio/utils/local_storage_structure.dart';

class Injector {
  final Palette palette = Palette();
  final QuickStorage quickStorage = QuickStorage();
}

Injector injector = Injector();
