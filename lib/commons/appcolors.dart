import 'package:flutter/material.dart';

/// Enter your app primer color code in opacity ----->>
/// NOTE: Don't change opacity code just change color code -------->>
Map<int, Color> textColor = {
  50: const Color(0x80cdf6f7),
  100: const Color(0xFFCDF6F7),
  200: const Color(0xFF9BEDEF),
  300: const Color(0xff6ae5e8),
  400: const Color(0xFF38DCE0),
  500: const Color(0xFF06D3D8),
  600: const Color(0xFF05A9AD),
  700: const Color(0xff047f82),
  800: const Color(0xff025456),
  900: const Color(0xff012a2b),
};

class AppColors {
  /// Enter your app primer color code ----->>
  static MaterialColor primerColor = MaterialColor(0x8073D8EF, textColor);

  ///************** Common Color **************///
  /// NOTE: DO not remove this colors -------->>>
  Color black = const Color(0xFF000000);
  Color white = const Color(0xFFFFFFFF);
  Color yellow = const Color(0xFFEEC829);
  Color yellowInRoute = const Color(0xFFF7EE1B);
  Color red = const Color(0xFFFF0025);
  Color grey = const Color(0xFF707070);
  Color transparent = const Color(0x00000000);
  Color textFiledBgColor = const Color(0xFFE5E8EC);
  Color textFiledBorderColor = const Color(0xFFC3C8D3).withOpacity(0.8);
  Color textFiledLabelColor = const Color(0xFF666F80);

  ///=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-= APP COLORS ==-=-=-=--=-=-=-=-=-=-=-=-=-///
  Color appColor = const Color(0xFF06D3D8);
  Color textBlack = const Color(0xFF1E1E1E);
  Color introBlack = const Color(0xFF09051C);
  Color buttonColor = const Color(0xFF06D3D8);
  Color textField = const Color(0xFFF4F4F4);
  Color lightText = const Color(0xFF3B3B3B);
  Color googleButton = const Color(0xFFEB4335);
  Color bottomSheetBar = const Color(0xFF06D2D8);
  Color brown = const Color(0xFF873202);
  Color allowButton = const Color(0xFFF6F6F6);
  Color shedow = const Color(0xFF5A6CEA);
  Color storyTegText = const Color(0xFF0B0721);
  Color textGreen = const Color(0xFF097823);
  Color yellowContainer = const Color(0xFFFFDE46);
  Color viewEye = const Color(0xFFC4C4C4);
  Color cloudShadow = const Color(0xFF131313);
  Color updateGreen = const Color(0xFF1FCC42);
  Color bottomSheetBackground = const Color(0xFF273840);
}
