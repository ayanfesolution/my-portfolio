import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/providers/system_setup/theme_data_provider.dart';
import 'package:portfolio/utils/app_settings/injector.dart';
import 'package:portfolio/utils/portfolio_data.dart';

import 'portfolio_widgets/about_quick_info.dart';

class MyPortfolio extends ConsumerStatefulWidget {
  const MyPortfolio({super.key});

  @override
  ConsumerState<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends ConsumerState<MyPortfolio>
    with WidgetsBindingObserver {
  double screenWidth = 1440;
  double screenHeight = 859;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(
      const Duration(milliseconds: 1),
      () {
        setState(() {
          screenWidth = MediaQuery.of(context).size.width;
          screenHeight = MediaQuery.of(context).size.height;

          print("Screen size changed: $screenWidth x $screenHeight");
        });
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;

      print("Screen size changed: $screenWidth x $screenHeight");
    });
  }

  double wwD(double width) {
    return (width / 1440) * screenWidth;
  }

  double hhD(double width) {
    return (width / 900) * screenHeight;
  }

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
            introDesktop(context, themeMode),
          ],
        ),
      ),
    );
  }

  Container introDesktop(BuildContext context, ThemeMode themeMode) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: wwD(122),
        vertical: hhD(96),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // width: wwD(768),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, I’m ${myPortfolioModel.bioData?.firstName ?? ''}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: wwD(60),
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Gap(hhD(6)),
                Text(
                  myPortfolioModel.bioData?.executiveSummary ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: wwD(16),
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const Gap(48),
                AboutQuickInfo(
                  isItQuickInfo: false,
                  title: myPortfolioModel.bioData?.address ?? '',
                  font: wwD(16),
                ),
                AboutQuickInfo(
                  isItQuickInfo: true,
                  title: myPortfolioModel.bioData?.quickShortCopy ?? '',
                  font: wwD(16),
                ),
                const Gap(8),
                Row(
                  children: [
                    Visibility(
                      visible:
                          (myPortfolioModel.bioData?.figma ?? '').isNotEmpty,
                      child: ImageButtonForActions(
                        themeMode: themeMode,
                        lightMode: 'assets/svgs/figmaLight.svg',
                        darkMode: 'assets/svgs/figma.svg',
                        urlPath: (myPortfolioModel.bioData?.figma ?? ''),
                      ),
                    ),
                    Visibility(
                      visible:
                          (myPortfolioModel.bioData?.github ?? '').isNotEmpty,
                      child: ImageButtonForActions(
                        themeMode: themeMode,
                        lightMode: 'assets/svgs/gitHubLight.svg',
                        darkMode: 'assets/svgs/gitHub.svg',
                        urlPath: (myPortfolioModel.bioData?.github ?? ''),
                      ),
                    ),
                    Visibility(
                      visible: (myPortfolioModel.bioData?.x ?? '').isNotEmpty,
                      child: ImageButtonForActions(
                        themeMode: themeMode,
                        lightMode: 'assets/svgs/twitterDark.svg',
                        darkMode: 'assets/svgs/twitter.svg',
                        urlPath: (myPortfolioModel.bioData?.x ?? ''),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Gap(wwD(128)),
          SizedBox(
            width: wwD(360),
            height: hhD(360),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: PictureBackgroundMode(
                    width: wwD(280),
                    hight: hhD(320),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: PictureBackgroundMode(
                    imageUrl: myPortfolioModel.bioData?.profilePictureUrl ?? '',
                    width: wwD(280),
                    hight: hhD(320),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageButtonForActions extends StatelessWidget {
  const ImageButtonForActions({
    super.key,
    required this.themeMode,
    required this.darkMode,
    required this.lightMode,
    required this.urlPath,
  });

  final ThemeMode themeMode;
  final String darkMode, lightMode, urlPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      (themeMode == ThemeMode.dark) ? darkMode : lightMode,
    );
  }
}

class PictureBackgroundMode extends ConsumerWidget {
  const PictureBackgroundMode({
    super.key,
    this.imageUrl,
    required this.width,
    required this.hight,
  });
  final String? imageUrl;
  final double width, hight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    return Container(
      height: hight,
      width: width,
      color: (imageUrl != null)
          ? Colors.transparent
          : themeMode == ThemeMode.dark
              ? injector.palette.pictureBackgroundDarkMode
              : injector.palette.pictureBackgroundLightMode,
      child: (imageUrl != null)
          ? Image.network(
              imageUrl ?? '',
              fit: BoxFit.contain,
            )
          : const Column(
              mainAxisSize: MainAxisSize.min,
            ),
    );
  }
}
