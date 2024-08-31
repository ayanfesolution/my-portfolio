import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/providers/system_setup/theme_data_provider.dart';
import 'package:portfolio/utils/extension/auto_resize.dart';

class AboutQuickInfo extends ConsumerWidget {
  const AboutQuickInfo({
    super.key,
    required this.title,
    required this.isItQuickInfo,
    required this.font,
  });
  final String title;
  final bool isItQuickInfo;
  final double font;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        themeMode == ThemeMode.dark
            ? SvgPicture.asset(
                isItQuickInfo
                    ? 'assets/svgs/Icon.svg'
                    : 'assets/svgs/address.svg',
              )
            : SvgPicture.asset(
                isItQuickInfo
                    ? 'assets/svgs/Icon.svg'
                    : 'assets/svgs/addressLightMode.svg',
              ),
        Gap(8..wwD),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: font,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
