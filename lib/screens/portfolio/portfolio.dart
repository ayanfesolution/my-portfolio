import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/providers/system_setup/theme_data_provider.dart';
import 'package:portfolio/utils/extension/auto_resize.dart';

class MyPortfolio extends ConsumerStatefulWidget {
  const MyPortfolio({super.key});

  @override
  ConsumerState<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends ConsumerState<MyPortfolio> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              ref.watch(getTheThemeData.notifier).changeThemeMode();
            },
            child: SvgPicture.asset(
              (themeMode == ThemeMode.light)
                  ? 'assets/svgs/darkMode.svg'
                  : 'assets/svgs/lightMode.svg',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 121,
                vertical: 96,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 768..wwD(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, I’m Sagar',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        Gap(6),
                        Text(
                          'I\'m a full stack developer (React.js & Node.js) with a focus on creating (and occasionally designing) exceptional digital experiences that are fast, accessible, visually appealing, and responsive. Even though I have been creating web applications for over 7 years, I still love it as if it was something new.',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Gap(48),
                        AboutQuickInfo(
                          isItQuickInfo: true,
                          title: '',
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 320,
                    width: 280..wwD(context),
                    
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutQuickInfo extends ConsumerWidget {
  const AboutQuickInfo({
    super.key,
    required this.title,
    required this.isItQuickInfo,
  });
  final String title;
  final bool isItQuickInfo;

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
        Gap(8..wwD(context)),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }
}

class TextButton extends StatelessWidget {
  const TextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
