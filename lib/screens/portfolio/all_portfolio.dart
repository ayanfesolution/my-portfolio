import 'package:flutter/material.dart';
import 'package:portfolio/screens/portfolio/portfolio.dart';
import 'package:portfolio/screens/portfolio/portfolio_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Monitor screen size changes
        screenWidth = constraints.maxWidth;
        screenHeight = constraints.maxHeight;

        // Respond to screen size change
        if (screenWidth > 600) {
          return const MyPortfolio();
        } else {
          return const PortfolioMobile();
        }
      },
    );
  }
}
