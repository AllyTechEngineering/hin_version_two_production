import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../utilities/adaptive_responsive_class.dart';
import '../utilities/calculate_button_size_class.dart';
import '../utilities/calculate_font_size_class.dart';
import '../widgets/background_decoration.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final CalculateFontSizeClass calculateFontSizeClass = CalculateFontSizeClass();
  final CalculateButtonSizeClass calculateButtonSizeClass = CalculateButtonSizeClass();
  final AdaptiveResponsive adaptiveResponsive = AdaptiveResponsive();
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  double iconHeightValue = 0.0;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: elevatedButtonWidth,
          child: ListTile(
            // shape: RoundedRectangleBorder(
            //   side: const BorderSide(width: 2.0, color: Colors.white),
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            title: AutoSizeText(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: AutoSizeText(
              subtitle.isEmpty ? 'Not set' : subtitle,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // tileColor: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    elevatedButtonWidth = calculateButtonSizeClass.calculateButtonWidth(context);
    elevatedButtonHeight = calculateButtonSizeClass.calculateButtonHeight(context);
    iconHeightValue = adaptiveResponsive.getIconSizeMethod(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
            ),
            iconSize: iconHeightValue,
            onPressed: () => context.go('/'),
          ),
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: AutoSizeText(
              'App Information',
              style: Theme.of(context).textTheme.displayLarge,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.description_outlined,
              ),
              iconSize: iconHeightValue,
              onPressed: () => context.go('/settings_screen'),
            ),
          ],
          flexibleSpace: Container(
            decoration: BackgroundDecoration.backgroundImageDecoration,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _infoTile('App name', _packageInfo.appName),
              _infoTile('Package name', _packageInfo.packageName),
              _infoTile('App version', _packageInfo.version),
              _infoTile('Build number', _packageInfo.buildNumber),
              _infoTile('Build signature', _packageInfo.buildSignature),
              _infoTile(
                'Installer store',
                _packageInfo.installerStore ?? 'not available',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
