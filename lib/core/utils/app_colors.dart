import 'package:flutter/material.dart';

class AppColors {
  static Color main =HexColor('#2F80ED');
  static Color backGround =Colors.grey.shade200;
  static Color backgroundPinned = HexColor('#2F80ED').withOpacity(.2);

  /// TEXT
  static Color primaryText = HexColor('#1B1A57');
  static Color secondaryText = HexColor('#4F5E7B');
  static Color grey = HexColor('#333333');
  static Color orange= HexColor('#F2994A');
  
  // STATE COLORS
  static Color yellow = HexColor('#F2C94C');
  static Color brown = HexColor('#BDBDBD');
  static Color green = HexColor('#4CE417');

}



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}