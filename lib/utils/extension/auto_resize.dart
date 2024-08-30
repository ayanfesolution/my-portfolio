import 'package:flutter/material.dart';

extension AutoResizeDesktop on num {
  // Method to convert the string to amount format

  // Get the proportionate height as per screen size
  double hh(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (this / 932) * screenHeight;
  }

// Get the proportionate height as per screen size
  double wwD(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return (this / 2318) * screenWidth;
  }
}

extension AutoResizeMobile on num {
  // Method to convert the string to amount format

  // Get the proportionate height as per screen size
  double hh(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return (this / 932) * screenHeight;
  }

// Get the proportionate height as per screen size
  double ww(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    return (this / 430) * screenWidth;
  }
}
