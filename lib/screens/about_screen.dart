import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/buttons_data.dart';
import '../utilities/adaptive_responsive_class.dart';
import '../utilities/calculate_button_size_class.dart';
import '../utilities/calculate_font_size_class.dart';
import '../utilities/package_info_util.dart';
import '../utilities/url_launcher.dart';
import '../widgets/background_decoration.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final CalculateFontSizeClass calculateFontSizeClass = CalculateFontSizeClass();
  final CalculateButtonSizeClass calculateButtonSizeClass = CalculateButtonSizeClass();
  final AdaptiveResponsive adaptiveResponsive = AdaptiveResponsive();
  final ButtonData buttonData = ButtonData();
  final UrlLauncher urlLauncher = UrlLauncher();
  // dynamic orientation, size, height, width;
  List<Map<String, String>> _buttonsData = [];
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  double iconHeightValue = 0.0;
  bool appTrackingTransparencyStatus = false;
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _initPackageInfoPlus();
    _appPermissionHandler();
  }

  _initPackageInfoPlus() async {
    appVersion = await PackageInfoUtil.getAppVersion();
    //debugPrint(' App Ver: $appVersion\n');
    setState(() {
      appVersion = appVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    elevatedButtonWidth = calculateButtonSizeClass.calculateButtonWidth(context);
    elevatedButtonHeight = calculateButtonSizeClass.calculateButtonHeight(context);
    iconHeightValue = adaptiveResponsive.getIconSizeMethod(context);
    _buttonsData = buttonData.getButtonData();

    // debugPrint('iconHeightValue: $iconHeightValue');
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
            ),
            iconSize: iconHeightValue,
            onPressed: () => context.go('/'),
          ),
          centerTitle: true,
          title: AutoSizeText(
            'About Us',
            style: Theme.of(context).textTheme.displayLarge,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          flexibleSpace: Container(
            decoration: BackgroundDecoration.backgroundImageDecoration,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.info_outlined,
              ),
              iconSize: iconHeightValue,
              onPressed: () => context.go('/info_screen'),
            ),
          ],
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BackgroundDecoration.backgroundImageDecoration,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _buttonsData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: elevatedButtonWidth,
                      height: elevatedButtonHeight,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4fb8db),
                            Color(0xFF176B87),
                          ],
                          stops: [0.0, 0.8],
                        ),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _cookieAlertRejectAccept(_buttonsData[index]['url']!);
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            fixedSize: Size(elevatedButtonWidth, elevatedButtonHeight),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            backgroundColor: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            _buttonsData[index]['text']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void getAlertMethod(String alertText) {
    FocusScope.of(context).unfocus();
    setState(() {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              alertText,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Dismiss',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }

  _cookieAlertRejectAccept(String urlValue) {
    if (appTrackingTransparencyStatus == true) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Entering a website with cookies.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                urlLauncher.launchURLBrowser(urlValue);
              },
              child: Container(
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(14),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Accept',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.redAccent,
                padding: const EdgeInsets.all(14),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Reject',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (appTrackingTransparencyStatus == false) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'App tracking disabled. Please check settings.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(10.0),
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Dismiss',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _appPermissionHandler() async {
    if (Platform.isMacOS || Platform.isAndroid) {
      appTrackingTransparencyStatus = true;
    } else if (Platform.isIOS) {
      var permissionRequest = await Permission.appTrackingTransparency.request();
      // debugPrint('permissionRequest = $permissionRequest');
      if (permissionRequest.isDenied) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 1 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isGranted) {
        appTrackingTransparencyStatus = true;
        // debugPrint('appTrackingTransparencyStatus 2 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isLimited) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 3 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isRestricted) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 4 = $appTrackingTransparencyStatus');
      } else if (permissionRequest.isProvisional) {
        appTrackingTransparencyStatus = false;
        // debugPrint('appTrackingTransparencyStatus 5 = $appTrackingTransparencyStatus');
      }
    }
  }
} //class
