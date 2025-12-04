import 'package:flutter/cupertino.dart';

const kPrimaryColor = Color(0xffe8b64b);
const kSecondaryColor = Color(0xff1fb0cb);
const kScaffoldColor = Color(0xFF0B0F1A);
const kBlackColor = Color(0xFF000000);
const kWhiteColor = Color(0xFFFFFFFF);
const kWhite2Color = Color(0xFFEFEFEF);
const kMutedGrayColor = Color(0xffA0AEC0);

const LinearGradient kAppGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  transform: GradientRotation(132.92 * 3.1415926535 / 180),
  colors: [Color(0xFF2DE3E0), Color(0xFF29C2B1)],
  stops: [0.0337, 1.0],
);
const LinearGradient kDividerGradientLeft = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color.fromRGBO(217, 217, 217, 0.0),
    Color.fromRGBO(217, 217, 217, 0.75),
  ],
  stops: [0.0, 0.9439],
);

const LinearGradient kDividerGradientRight = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color.fromRGBO(217, 217, 217, 0.75),
    Color.fromRGBO(217, 217, 217, 0.0),
  ],
  stops: [0.0, 0.9439],
);

const int _primaryPrimaryValue = 0xFFFFBD3C;

Map<int, Color> color = {
  50: Color(0xFFFFF6E8),
  100: Color(0xFFFFE9C6),
  200: Color(0xFFFFDBA1),
  300: Color(0xFFFFCD7B),
  400: Color(0xFFFFC261),
  500: Color(_primaryPrimaryValue), // FFBD3C
  600: Color(0xFFE6A835),
  700: Color(0xFFCC9330),
  800: Color(0xFFB27F2A),
  900: Color(0xFF805D20),
};
