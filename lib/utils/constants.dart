import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utils/app_settings/injector.dart';
import 'package:portfolio/utils/extension/auto_resize.dart';
import 'package:portfolio/utils/extension/widget_extention.dart';



final Color textColor = injector.palette.textColor;

const bool kDebugState = true;

TextStyle kTextStyleCustom({
  required BuildContext context,
  double fontSize = 14,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w400,
  overflow = TextOverflow.visible,
  Color color = const Color(0xFF222224),
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    overflow: overflow,
    color: color,
  );
}

TextStyle kTextStyleFont100({
  required double size,
  required BuildContext context,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w100,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont200({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w200,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont300({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size..ww(context),
    fontWeight: FontWeight.w300,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont400({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont500({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w500,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont600({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w600,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont700({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w700,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont800({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w800,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

TextStyle kTextStyleFont900({
  required BuildContext context,
  double size = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w900,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    color: textColor,
  );
}

kToastMsgPopUp({
  required String msg,
  ToastGravity toastStyle = ToastGravity.CENTER,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: toastStyle,
    timeInSecForIosWeb: 1,
    backgroundColor: injector.palette.primaryColor,
    textColor: Colors.white,
    fontSize: 16,
  );
}

SizedBox yMargin({
  required double size,
}) {
  return SizedBox(
    height: size,
  );
}

SizedBox xMargin({required double size}) {
  return SizedBox(
    width: size,
  );
}

class CXSpinner extends StatelessWidget {
  const CXSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150..hh(context),
        child: Lottie.asset('assets/loader.json').paddingOnly(
          l: 20..ww(context),
        ),
      ),
    );
  }
}

// class CXLoader {
//   static void show(BuildContext context) {
//     return Loader.show(
//       context,
//       progressIndicator: const CXSpinner(),
//       overlayColor: Colors.black54,
//     );
//   }

//   static void hide() {
//     return Loader.hide();
//   }
// }
