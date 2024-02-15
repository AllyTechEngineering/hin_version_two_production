import 'package:flutter/material.dart';
import 'dart:io';

import 'constants.dart';

class CalculateButtonSizeClass {
  double calculateButtonWidth(BuildContext context) {
    double adjustedButtonWidth = 10.0;
    // devicePixelRatioValue is the number of device pixels for each logical pixel.
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;

    dynamic androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    dynamic androidDeviceActualPixelHeight = (devicePixelRatioValue * height);

    if (Platform.isIOS) {
      // iPhones: 320 w x 568 h
      // iPhone SE 1st gen
      // iPhone 5C
      // iPhone 5S
      // iPhone 5
      double iPhone320x568portraitWidth = 320;
      double iPhone320x568landscapeWidth = 568;
      if ((orientation == Orientation.portrait) && (width == 320 && height == 568)) {
        adjustedButtonWidth = iPhone320x568portraitWidth * kElevatedButtonWidth;
        ;
        // debugPrint('in iPhones: 320 w x 568 height: $height\nwidth: $width');
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape && (width == 568 && height == 320)) {
        adjustedButtonWidth = iPhone320x568landscapeWidth * kElevatedButtonWidth;
        ;
        return adjustedButtonWidth;
      }
      // iPhones: 375 w x 667 h
      // iPhone SE 3rd gen
      // iPhone SE 2nd gen
      // iPhone 8
      // iPhone 7
      // iPhone 6s
      // iPhone 6
      double iPhone375x667portrait = 375.0;
      double iPhone375x667landscape = 667.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 667)) {
        adjustedButtonWidth = iPhone375x667portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if (orientation == Orientation.landscape && (width == 667 && height == 375)) {
        adjustedButtonWidth = iPhone375x667landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 414 w x 736 h
      // iPhone 8 Plus
      // iPhone 7 Plus
      // iPhone 6s Plus
      // iPhone 6 Plus
      double iPhone414x736portrait = 414.0;
      double iPhone414x736landscape = 736.0;
      if ((orientation == Orientation.portrait) && (width == 414 && height == 736)) {
        adjustedButtonWidth = iPhone414x736portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && (width == 736 && height == 414)) {
        adjustedButtonWidth = iPhone414x736landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      //  iPhones: 375 w x 812 h
      // iPhone 13 mini
      // iPhone 12 mini
      // iPhone 11 Pro
      // iPhone XS
      // iPhone X
      double iPhone375x812portrait = 375.0;
      double iPhone375x812landscape = 812.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 812)) {
        adjustedButtonWidth = iPhone375x812portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && (width == 812 && height == 375)) {
        adjustedButtonWidth = iPhone375x812landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 390 w x 844 h
      // iPhone 14
      // iPhone 13
      // iPhone 13 Pro
      // iPhone 12
      // iPhone 12 Pro
      double iPhone390x844portrait = 390.0;
      double iPhone390x844landscape = 844.0;
      if ((orientation == Orientation.portrait) && ((width == 390) && (height == 844))) {
        adjustedButtonWidth = iPhone390x844portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 844) && (height == 390))) {
        adjustedButtonWidth = iPhone390x844landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 393 w x 852 h
      // iPhone 15 Pro
      // iPhone 15
      // iPhone 14 Pro
      double iPhone393x852portrait = 393.0;
      double iPhone393x852landscape = 852.0;
      if ((orientation == Orientation.portrait) && ((width == 393) && (height == 852))) {
        // debugPrint(
        //     'in else portrait: iPhones: 430 w x 932 h\nadjustedFontSize = $adjustedFontSize');
        adjustedButtonWidth = iPhone393x852portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 852) && (height == 393))) {
        // debugPrint('in else landscape: iPhones: 852 w x 393 h');
        adjustedButtonWidth = iPhone393x852landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 414 w x 896 h
      // iPhone 11 Pro Max
      // iPhone 11
      // iPhone XR
      // iPhone XS Max
      double iPhone414x896portrait = 414.0;
      double iPhone414x896landscape = 896.0;
      if ((orientation == Orientation.portrait) && ((width == 414) && (height == 896))) {
        adjustedButtonWidth = iPhone414x896portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 896) && (height == 414))) {
        adjustedButtonWidth = iPhone414x896landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 428 w x 926 h
      // iPhone 14 Plus
      // iPhone 13 Pro Max
      // iPhone 12 Pro Max
      double iPhone428x926portrait = 428.0;
      double iPhone428x926landscape = 926.0;
      if ((orientation == Orientation.portrait) && ((width == 428) && (height == 926))) {
        adjustedButtonWidth = iPhone428x926portrait * kElevatedButtonWidth;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 926) && (height == 428))) {
        adjustedButtonWidth = iPhone428x926landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }
      // iPhones: 430 w x 932 h
      // iPhone 15 Pro Max
      // iPhone 15 Plus
      // iPhone 14 Pro Max
      double iPhone430x932portrait = 430.0;
      double iPhone430x932landscape = 932.0;
      if ((orientation == Orientation.portrait) && ((width == 430) && (height == 932))) {
        adjustedButtonWidth = iPhone430x932portrait * kElevatedButtonWidth;
        debugPrint('in iPhone430x932portrait adjustedButtonWidth =$adjustedButtonWidth');
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((width == 932) && (height == 430))) {
        adjustedButtonWidth = iPhone430x932landscape * kElevatedButtonWidth;
        return adjustedButtonWidth;
      }

      // Generic iPad width
      if ((orientation == Orientation.portrait) && ((height >= 1024))) {
        adjustedButtonWidth = height * 0.6;
        return adjustedButtonWidth;
      } else if ((orientation == Orientation.landscape) && ((height >= 744))) {
        adjustedButtonWidth = height * 0.6;
        return adjustedButtonWidth;
      } else {
        // default font size
        return adjustedButtonWidth = 12.0;
      }
    }
    if (Platform.isMacOS) {
      //  MacOS loaded default 800 w x 600 h
      debugPrint('In macOS orientation = $orientation');
      // double macOSportrait = 1600.0;
      // double macOSlandscape = 1200.0;
      if (((orientation == Orientation.landscape) || (orientation == Orientation.portrait)) &&
          ((width <= 430))) {
        adjustedButtonWidth = width * 0.6;
        return adjustedButtonWidth;
      } else if (((orientation == Orientation.landscape) ||
              (orientation == Orientation.portrait)) &&
          ((width >= 430))) {
        debugPrint('in if ((orientation == Orientation.landscape) (width >= 430): $width ');
        adjustedButtonWidth = width * 0.6;
        return adjustedButtonWidth;
      } else {
        // default font size
        return adjustedButtonWidth = 12.0;
      }
    }
    if (Platform.isAndroid) {
      //portrait
      // debugPrint(
      //     'Android device button width orientation: $orientation\nandroidDeviceActualPixelWidth: $androidDeviceActualPixelWidth\nandroidDeviceActualPixelHeight: $androidDeviceActualPixelHeight');
      // Portrait
      if (orientation == Orientation.portrait) {
        if ((androidDeviceActualPixelWidth <= 500)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.60;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 500 &&
            androidDeviceActualPixelWidth <= 1000)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.60;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1001 &&
            androidDeviceActualPixelWidth <= 1200)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.55;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1201 &&
            androidDeviceActualPixelWidth <= 1600)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.45;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1601 &&
            androidDeviceActualPixelWidth <= 1900)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.55;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1901)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        }
      }

      // landscape
      if (orientation == Orientation.landscape) {
        if ((androidDeviceActualPixelWidth <= 800)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.5;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 801 &&
            androidDeviceActualPixelWidth <= 1300)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.38;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 1301 &&
            androidDeviceActualPixelWidth <= 2000)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2001 &&
            androidDeviceActualPixelWidth <= 2300)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2301 &&
            androidDeviceActualPixelWidth <= 2600)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 2601 &&
            androidDeviceActualPixelWidth <= 3000)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.35;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 3001 &&
            androidDeviceActualPixelWidth <= 3200)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        } else if ((androidDeviceActualPixelWidth >= 3201)) {
          adjustedButtonWidth = androidDeviceActualPixelWidth * 0.25;
          return adjustedButtonWidth;
        }
      }
    }
    return adjustedButtonWidth;
  }

  double calculateButtonHeight(BuildContext context) {
    double adjustedButtonHeight = 10.0;
    // devicePixelRatioValue is the number of device pixels for each logical pixel.
    dynamic devicePixelRatioValue = MediaQuery.of(context).devicePixelRatio;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;

    dynamic androidDeviceActualPixelWidth = (devicePixelRatioValue * width);
    dynamic androidDeviceActualPixelHeight = (devicePixelRatioValue * height);
    if (Platform.isIOS) {
      // iPhones: 320 w x 568 h
      // iPhone SE 1st gen - simulator
      // iPhone 5C
      // iPhone 5S
      // iPhone 5
      double iPhone320x568portraitHeight = 568;
      double iPhone320x568landscapeHeight = 320.0;
      if ((orientation == Orientation.portrait) && (width == 320 && height == 568)) {
        adjustedButtonHeight = iPhone320x568portraitHeight * kElevatedButtonHeight;
        // debugPrint('in iPhones: 320 w x 568 height: $height\nwidth: $width');
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape && (width == 568 && height == 320)) {
        adjustedButtonHeight = iPhone320x568landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 375 w x 667 h
      // iPhone SE 3rd gen
      // iPhone SE 2nd gen
      // iPhone 8 - simulator
      // iPhone 7
      // iPhone 6s
      // iPhone 6
      double iPhone375x667portraitHeight = 667.0;
      double iPhone375x667landscapeHeight = 375.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 667)) {
        adjustedButtonHeight = iPhone375x667portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if (orientation == Orientation.landscape && (width == 667 && height == 375)) {
        adjustedButtonHeight = iPhone375x667landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 414 w x 736 h
      // iPhone 8 Plus
      // iPhone 7 Plus
      // iPhone 6s Plus
      // iPhone 6 Plus
      double iPhone414x736portraitHeight = 736.0;
      double iPhone414x736landscapeHeight = 414.0;
      if ((orientation == Orientation.portrait) && (width == 414 && height == 736)) {
        adjustedButtonHeight = iPhone414x736portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && (width == 736 && height == 414)) {
        adjustedButtonHeight = iPhone414x736landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      //  iPhones: 375 w x 812 h
      // iPhone 13 mini
      // iPhone 12 mini
      // iPhone 11 Pro - simulator
      // iPhone XS
      // iPhone X
      double iPhone375x812portraitHeight = 812.0;
      double iPhone375x812landscapeHeight = 375.0;
      if ((orientation == Orientation.portrait) && (width == 375 && height == 812)) {
        adjustedButtonHeight = iPhone375x812portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && (width == 812 && height == 375)) {
        adjustedButtonHeight = iPhone375x812landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 390 w x 844 h
      // iPhone 14
      // iPhone 13
      // iPhone 13 Pro
      // iPhone 12
      // iPhone 12 Pro
      double iPhone390x844portraitHeight = 844.0;
      double iPhone390x844landscapeHeight = 390.0;
      if ((orientation == Orientation.portrait) && ((width == 390) && (height == 844))) {
        adjustedButtonHeight = iPhone390x844portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 844) && (height == 390))) {
        adjustedButtonHeight = iPhone390x844landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 393 w x 852 h
      // iPhone 15 Pro - simulator
      // iPhone 15
      // iPhone 14 Pro
      double iPhone393x852portraitHeight = 852.0;
      double iPhone393x852landscapeHeight = 393.0;
      if ((orientation == Orientation.portrait) && ((width == 393) && (height == 852))) {
        debugPrint(
            'in else portrait: iPhones: 393 w x 852 h = \nadjustedFontSize = $adjustedButtonHeight');
        adjustedButtonHeight = iPhone393x852portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 852) && (height == 393))) {
        debugPrint('in else landscape: iPhones: 393 w x 852 h = \n$adjustedButtonHeight');
        adjustedButtonHeight = iPhone393x852landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 414 w x 896 h
      // iPhone 11 Pro Max - simulator
      // iPhone 11
      // iPhone XR
      // iPhone XS Max
      double iPhone414x896portraitHeight = 896.0;
      double iPhone414x896landscapeHeight = 414.0;
      if ((orientation == Orientation.portrait) && ((width == 414) && (height == 896))) {
        adjustedButtonHeight = iPhone414x896portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 896) && (height == 414))) {
        adjustedButtonHeight = iPhone414x896landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 428 w x 926 h
      // iPhone 14 Plus - simulator
      // iPhone 13 Pro Max
      // iPhone 12 Pro Max
      double iPhone428x926portraitHeight = 926.0;
      double iPhone428x926landscapeHeight = 428.0;
      if ((orientation == Orientation.portrait) && ((width == 428) && (height == 926))) {
        adjustedButtonHeight = iPhone428x926portraitHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 926) && (height == 428))) {
        adjustedButtonHeight = iPhone428x926landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }
      // iPhones: 430 w x 932 h
      // iPhone 15 Pro Max - simulator
      // iPhone 15 Plus
      // iPhone 14 Pro Max
      double iPhone430x932portraitHeight = 932.0;
      double iPhone430x932landscapeHeight = 430.0;

      if ((orientation == Orientation.portrait) && ((width == 430) && (height == 932))) {
        adjustedButtonHeight = iPhone430x932portraitHeight * kElevatedButtonHeight;
        debugPrint('in iPhone430x932portrait adjustedButtonHeight =$adjustedButtonHeight');
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width == 932) && (height == 430))) {
        adjustedButtonHeight = iPhone430x932landscapeHeight * kElevatedButtonHeight;
        return adjustedButtonHeight;
      }

      if ((orientation == Orientation.portrait) && ((width >= 744))) {
        adjustedButtonHeight = height * 0.1;
        return adjustedButtonHeight;
      } else if ((orientation == Orientation.landscape) && ((width >= 1024))) {
        adjustedButtonHeight = height * 0.1;
        return adjustedButtonHeight;
      } else {
        // default font size
        return adjustedButtonHeight = 30.0;
      }
    }
    if (Platform.isMacOS) {
      if (((orientation == Orientation.landscape) || (orientation == Orientation.portrait)) &&
          ((width <= 430))) {
        adjustedButtonHeight = height * 0.03;
        return adjustedButtonHeight;
      } else if (((orientation == Orientation.landscape) ||
              (orientation == Orientation.portrait)) &&
          ((width >= 430))) {
        adjustedButtonHeight = height * 0.10;
        return adjustedButtonHeight;
      } else {
        // default font size
        return adjustedButtonHeight = 30.0;
      }
    }
    if (Platform.isAndroid) {
      // debugPrint(
      //     'Android device button width orientation: $orientation\nandroidDeviceActualPixelWidth: $androidDeviceActualPixelWidth\nandroidDeviceActualPixelHeight: $androidDeviceActualPixelHeight');

      // Portrait button height
      if (orientation == Orientation.portrait) {
        if ((androidDeviceActualPixelHeight <= 800)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.06;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 801 &&
            androidDeviceActualPixelHeight <= 1300)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.06;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1301 &&
            androidDeviceActualPixelHeight <= 2200)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.05;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2201 &&
            androidDeviceActualPixelHeight <= 2600)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.05;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 2601 &&
            androidDeviceActualPixelHeight <= 3000)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.035;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3001 &&
            androidDeviceActualPixelHeight <= 3200)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 3201)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.025;
          return adjustedButtonHeight;
        }
      }

      // landscape button height
      if (orientation == Orientation.landscape) {
        if ((androidDeviceActualPixelHeight <= 500)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.1;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 501 &&
            androidDeviceActualPixelHeight <= 1000)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.06;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1001 &&
            androidDeviceActualPixelHeight <= 1300)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.06;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1301 &&
            androidDeviceActualPixelHeight <= 1400)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.07;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1401 &&
            androidDeviceActualPixelHeight <= 1500)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.05;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1501 &&
            androidDeviceActualPixelHeight <= 1800)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.06;
          return adjustedButtonHeight;
        } else if ((androidDeviceActualPixelHeight >= 1801)) {
          adjustedButtonHeight = androidDeviceActualPixelHeight * 0.053;
          return adjustedButtonHeight;
        }
      }
    }
    // default font size
    return adjustedButtonHeight = 100.0;
  }
}
