import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveResponsive {
  double getIconSizeMethod(BuildContext context) {
    double iconsSizeValue = 0.0;
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    dynamic androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    dynamic androidDeviceActualPixelHeight = (devicePixelRatioValue * height);
    // iOS
    if (Platform.isIOS) {
      debugPrint('Platform.isIOS');
      // Portrait
      if (orientation == Orientation.portrait) {
        debugPrint('Orientation.portrait');
      }
      // Landscape
      if (orientation == Orientation.landscape) {
        debugPrint('Orientation.landscape');
      }
    }
    // macOS
    if (Platform.isMacOS) {
      debugPrint('Platform.isMacOS');
      // Portrait
      if (orientation == Orientation.portrait) {
        debugPrint('Orientation.portrait');
      }
      // Landscape
      if (orientation == Orientation.landscape) {
        debugPrint('Orientation.landscape');
      }
    }
    // Android
    if (Platform.isAndroid) {
      // debugPrint('Platform.isAndroid');
      // Portrait
      if (orientation == Orientation.portrait) {
        if ((androidDeviceActualPixelHeight <= 800)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.022;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 801 &&
            androidDeviceActualPixelHeight <= 1300)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.015;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1301 &&
            androidDeviceActualPixelHeight <= 2200)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.015;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 2201 &&
            androidDeviceActualPixelHeight <= 2600)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.015;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 2601 &&
            androidDeviceActualPixelHeight <= 3000)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.015;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 3001 &&
            androidDeviceActualPixelHeight <= 3200)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.0085;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 3201)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.02;
          return iconsSizeValue;
        }
      }
      // Landscape
      if (orientation == Orientation.landscape) {
        if ((androidDeviceActualPixelHeight <= 500)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.045;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 501 &&
            androidDeviceActualPixelHeight <= 1000)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.025;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1001 &&
            androidDeviceActualPixelHeight <= 1300)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.025;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1301 &&
            androidDeviceActualPixelHeight <= 1400)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.035;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1401 &&
            androidDeviceActualPixelHeight <= 1600)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.025;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1601 &&
            androidDeviceActualPixelHeight <= 1800)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.025;
          return iconsSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1801)) {
          iconsSizeValue = androidDeviceActualPixelHeight * 0.019;
          return iconsSizeValue;
        }
      }
    }
    return iconsSizeValue;
  }

  double getInputTextFieldSizeMethod(BuildContext context) {
    double textFieldSizeValue = 0.0;
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    dynamic androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    dynamic androidDeviceActualPixelHeight = (devicePixelRatioValue * height);

    // iOS
    if (Platform.isIOS) {
      debugPrint('Platform.isIOS');
      // Portrait
      if (orientation == Orientation.portrait) {
        debugPrint('Orientation.portrait');
      }
      // Landscape
      if (orientation == Orientation.landscape) {
        debugPrint('Orientation.landscape');
      }
    }
    // macOS
    if (Platform.isMacOS) {
      debugPrint('Platform.isMacOS');
      // Portrait
      if (orientation == Orientation.portrait) {
        // debugPrint('Orientation.portrait');
      }
      // Landscape
      if (orientation == Orientation.landscape) {
        // debugPrint('Orientation.landscape');
      }
    }
    // Android
    if (Platform.isAndroid) {
      // debugPrint('Platform.isAndroid');
      // Portrait
      if (orientation == Orientation.portrait) {
        if ((androidDeviceActualPixelHeight <= 800)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.022;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 801 &&
            androidDeviceActualPixelHeight <= 1300)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.015;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1301 &&
            androidDeviceActualPixelHeight <= 2200)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.015;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 2201 &&
            androidDeviceActualPixelHeight <= 2600)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.015;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 2601 &&
            androidDeviceActualPixelHeight <= 3000)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.045;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 3001 &&
            androidDeviceActualPixelHeight <= 3200)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.0085;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 3201)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.02;
          return textFieldSizeValue;
        }
      }
      // Landscape
      if (orientation == Orientation.landscape) {
        if ((androidDeviceActualPixelHeight <= 500)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.045;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 501 &&
            androidDeviceActualPixelHeight <= 1000)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.025;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1001 &&
            androidDeviceActualPixelHeight <= 1300)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.025;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1301 &&
            androidDeviceActualPixelHeight <= 1400)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.035;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1401 &&
            androidDeviceActualPixelHeight <= 1600)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.025;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1601 &&
            androidDeviceActualPixelHeight <= 1800)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.055;
          return textFieldSizeValue;
        } else if ((androidDeviceActualPixelHeight >= 1801)) {
          textFieldSizeValue = androidDeviceActualPixelHeight * 0.019;
          return textFieldSizeValue;
        }
      }
    }
    return textFieldSizeValue;
  }
}
