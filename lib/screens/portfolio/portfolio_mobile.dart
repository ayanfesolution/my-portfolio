import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/screens/portfolio/portfolio.dart';
import 'package:portfolio/screens/portfolio/portfolio_widgets/about_quick_info.dart';
import 'package:portfolio/utils/portfolio_data.dart';

import '../../providers/system_setup/theme_data_provider.dart';

class PortfolioMobile extends ConsumerStatefulWidget {
  const PortfolioMobile({super.key});

  @override
  ConsumerState<PortfolioMobile> createState() => _PortfolioMobileState();
}

class _PortfolioMobileState extends ConsumerState<PortfolioMobile>
    with WidgetsBindingObserver {
  double screenWidth = 375;
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
    return (width / 375) * screenWidth;
  }

  double hhD(double width) {
    return (width / 900) * screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ref.watch(getTheThemeData);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: wwD(16)),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: hhD(300),
                      width: wwD(280),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: PictureBackgroundMode(
                              width: wwD(280),
                              hight: hhD(280),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: PictureBackgroundMode(
                              imageUrl:
                                  myPortfolioModel.bioData?.profilePictureUrl ??
                                      '',
                              width: wwD(280),
                              hight: hhD(280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Hi, I’m ${myPortfolioModel.bioData?.firstName ?? ''}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: wwD(36),
                          fontWeight: FontWeight.w600,
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
                    font: wwD(10),
                  ),
                  Gap(hhD(8)),
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
          ],
        ),
      ),
    );
  }
}
