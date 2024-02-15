import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hull_identification_number/utilities/adaptive_responsive_class.dart';
// import 'package:styled_text/tags/styled_text_tag.dart';
// import 'package:styled_text/widgets/styled_text.dart';
import '../blocs/mic_data/mic_data_cubit.dart';
import '../blocs/hin_data/hin_data_cubit.dart';
import '../models/hin_data_model.dart';
import '../models/mic_data_model.dart';
import '../repositories/mic_repository.dart';
import '../utilities/calculate_button_size_class.dart';
import '../utilities/calculate_font_size_class.dart';
// import '../utilities/constants.dart';
import '../utilities/decode_hin_class.dart';
// import '../utilities/hin_validator.dart';
import '../widgets/background_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final CalculateFontSizeClass calculateFontSizeClass = CalculateFontSizeClass();
  final CalculateButtonSizeClass calculateButtonSizeClass = CalculateButtonSizeClass();
  final AdaptiveResponsive adaptiveResponsive = AdaptiveResponsive();
  final TextEditingController hinController = TextEditingController();
  final MicRepository micRepository = MicRepository();
  final DecodeHinClass decodeHinClass = DecodeHinClass();
  double elevatedButtonWidth = 0.0;
  double elevatedButtonHeight = 0.0;
  double iconHeightValue = 0.0;
  final List<String> micDataForListView = [];
  MicDataModel micDataModel = const MicDataModel();
  HinDataModel hinDataModel = const HinDataModel();
  String decodedInfo = '';

  @override
  Widget build(BuildContext context) {
    InputDecorationTheme currentTheme = Theme.of(context).inputDecorationTheme;
    elevatedButtonWidth = calculateButtonSizeClass.calculateButtonWidth(context);
    elevatedButtonHeight = calculateButtonSizeClass.calculateButtonHeight(context);
    iconHeightValue = adaptiveResponsive.getIconSizeMethod(context);
    // debugPrint('iconHeightValue: $iconHeightValue');
    InputDecoration hinInputDecoration = InputDecoration(
      // Your original decoration properties
      enabledBorder: currentTheme.border,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.0)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      hintStyle: Theme.of(context).textTheme.displaySmall,
      hintText: 'Enter a 12 digit HIN...',
      prefixIcon: Icon(
        Icons.search,
        size: iconHeightValue * 2,
      ),
      prefixIconColor: currentTheme.prefixIconColor,
      prefixStyle: currentTheme.prefixStyle,
    );
    return BlocBuilder<MicDataCubit, MicDataState>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.quiz_outlined,
                  // color: Colors.white,
                ),
                iconSize: iconHeightValue,
                onPressed: () => context.go('/definition_screen'),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.description_rounded,
                    // color: Colors.white,
                  ),
                  iconSize: iconHeightValue,
                  onPressed: () => context.go('/settings_screen'),
                ),
              ],
              centerTitle: true,
              title: AutoSizeText(
                'Boat HIN Decoder',
                style: Theme.of(context).textTheme.displayLarge,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              flexibleSpace: Container(
                decoration: BackgroundDecoration.backgroundImageDecoration,
              ),
            ),
            body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: BackgroundDecoration.backgroundImageDecoration,
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: elevatedButtonWidth,
                        height: elevatedButtonHeight,
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: hinController,
                          decoration: hinInputDecoration,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      width: elevatedButtonWidth,
                      height: elevatedButtonHeight,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFDAFFFB),
                            Color(0xFF176B87),
                          ],
                          stops: [0.0, 0.8],
                        ),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: BlocListener<HinDataCubit, HinDataState>(
                        listener: (context, state) {},
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context); //get the current focus node
                            if (!currentFocus.hasPrimaryFocus) {
                              //prevent Flutter from throwing an exception
                              currentFocus
                                  .unfocus(); //unfocused from current focus, so that keyboard will dismiss
                            }
                            if (hinController.text.isNotEmpty) {
                              checkUserInputHinValidator(hinController.text.trim().toUpperCase());
                              checkUserHinEntryLength(hinController.text.trim().toUpperCase());
                              context.read<HinDataCubit>().userHinInputDecode(
                                    hinController.text.trim().toUpperCase(),
                                  );
                            } else if (hinController.text.isEmpty) {
                              checkUserHinEntryLength(hinController.text.trim().toUpperCase());
                            }
                            // checkUserMicEntryValidForm(hinController.text.trim().toUpperCase());
                            context.read<MicDataCubit>().getUserEnteredMicData(
                                  hinController.text.trim().toUpperCase(),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              // fixedSize: Size((width * 0.75), (height / 5.5)),
                              fixedSize: Size(elevatedButtonWidth, elevatedButtonHeight),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              backgroundColor: Colors.transparent),
                          child: AutoSizeText(
                            'Decode HIN',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: elevatedButtonWidth,
                      height: elevatedButtonHeight,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFDAFFFB),
                            Color(0xFF176B87),
                          ],
                          stops: [0.0, 0.8],
                        ),
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          FocusScopeNode currentFocus =
                              FocusScope.of(context); //get the current focus node
                          if (!currentFocus.hasPrimaryFocus) {
                            //prevent Flutter from throwing an exception
                            currentFocus
                                .unfocus(); //unfocused from current focus, so that keyboard will dismiss
                          }
                          setState(() {
                            hinController.clear();
                            context.read<MicDataCubit>().getUserEnteredMicData('111');
                            context.read<HinDataCubit>().userHinInputDecode('');
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            fixedSize: Size(elevatedButtonWidth, elevatedButtonHeight),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1.0, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            backgroundColor: Colors.transparent),
                        child: AutoSizeText(
                          'Clear HIN',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    BlocBuilder<HinDataCubit, HinDataState>(
                      builder: (context, state) {
                        final hinResults = state.hinDataResponse;
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(
                                color: Colors.white60,
                                thickness: 4,
                                endIndent: 2,
                                indent: 2,
                              ),
                              Center(
                                child: AutoSizeText(
                                  // decodedInfo
                                  'Decoded HIN Results',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              AutoSizeText(
                                // decodedInfo
                                'Manuf ID: ${hinResults[0].manufIdentCode}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              AutoSizeText(
                                // decodedInfo
                                'Serial Number: ${hinResults[0].hullSerialNumber}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              AutoSizeText(
                                // decodedInfo
                                'Month of Production: ${hinResults[0].monthOfProduction}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              AutoSizeText(
                                // decodedInfo
                                'Year of Production: ${hinResults[0].yearOfProduction}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 2,
                                endIndent: 2,
                                indent: 2,
                              ),
                              AutoSizeText(
                                // decodedInfo
                                'Model Year: ${hinResults[0].modelYear}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 4.0),
                    ),
                    BlocBuilder<MicDataCubit, MicDataState>(
                      builder: (context, state) {
                        if (state is LoadedState) {
                          final micResults = state.micData;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(
                                  color: Colors.white60,
                                  thickness: 4,
                                  endIndent: 2,
                                  indent: 2,
                                ),
                                Center(
                                  child: AutoSizeText(
                                    'Manuf. ID Code',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                AutoSizeText(
                                  'Manuf: ${micResults[0].company}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Divider(
                                  color: Colors.white60,
                                  thickness: 2,
                                  endIndent: 2,
                                  indent: 2,
                                ),
                                AutoSizeText(
                                  'Address: ${micResults[0].address}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Divider(
                                  color: Colors.white60,
                                  thickness: 2,
                                  endIndent: 2,
                                  indent: 2,
                                ),
                                AutoSizeText(
                                  'City: ${micResults[0].city}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Divider(
                                  color: Colors.white60,
                                  thickness: 2,
                                  endIndent: 2,
                                  indent: 2,
                                ),
                                AutoSizeText(
                                  'State: ${micResults[0].state}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: 1.0,
                                ),
                              ],
                            ),
                          );
                        } else if (state is ErrorState) {
                          debugPrint('In HomeScreenTwo else if state is ErrorState: $state');
                        }
                        return const AutoSizeText('');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  } //Widget build

/*
RegExp straightYearHinFormatRegExp = RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}(0[1-9]|1[0-2])\d+$');
RegExp modelYearHinFormatRegExp = RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[Mm]\d{2}[0-9a-lA-L]$');
RegExp currentHinFormatRegExp = RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[a-lA-L]\d{3}$');
 */
  void checkUserInputHinValidator(String userInputHin) {
    RegExp straightYearHinFormatRegExp =
        RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}(0[1-9]|1[0-2])\d+$');
    bool straightYearHinFormatResult = straightYearHinFormatRegExp.hasMatch(userInputHin);
    if (straightYearHinFormatResult) {
      String tempStraightYearValue = userInputHin.substring(10, 12);
      String tempStraightYearMonthValue = userInputHin.substring(8, 10);
      // debugPrint(
      //     'Check straight year Year: $tempStraightYearValue\nMonth: $tempStraightYearMonthValue');
      if (tempStraightYearValue.isNotEmpty && tempStraightYearMonthValue.isNotEmpty) {
        int tempYear = int.parse(tempStraightYearValue);
        int tempMonth = int.parse(tempStraightYearMonthValue);
        //  debugPrint('tempMonth: $tempMonth');
        if (tempYear >= 85 || tempYear <= 71 || tempMonth < 1 || tempMonth > 12) {
          straightYearHinFormatResult = false;
          getAlertMethod(
              'Check Straight Year Format:\nyears are 72..84 & months are 01 to 12 Jan...Dec\nCheck formats on Info Page.\nClear HIN and try again.');
        } else {
          straightYearHinFormatResult = true;
          getAlertMethod('Correct - Straight Year Format');
        }
      }
    }
    RegExp modelYearHinFormatRegExp =
        RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[Mm]\d{2}[0-9a-lA-L]$');
    bool modelYearHinFormatResult = modelYearHinFormatRegExp.hasMatch(userInputHin);
    if (modelYearHinFormatResult) {
      String tempModelYearValue = userInputHin.substring(9, 11);
      dynamic tempLastModelYearMonthValue = userInputHin.substring(11, 12);
      if (tempLastModelYearMonthValue.isNotEmpty) {
        if (tempLastModelYearMonthValue is int) {
          getAlertMethod(
              'Model Year Format:\nyou entered a number for the last digit.\nShould be A to L for month code.\nCheck formats on Info Page.\nClear HIN and try again.');
        } else if (tempLastModelYearMonthValue is String) {
          RegExp checkModelYearMonthValue = RegExp(r'^[A-La-l]$');
          bool modelYearMonth = checkModelYearMonthValue.hasMatch(tempLastModelYearMonthValue);
          if (!modelYearMonth) {
            modelYearHinFormatResult = false;
            getAlertMethod(
                'Model Year Format:\nLast digit is A..L for month code.\nCheck formats on Info Page.\nClear HIN and try again.');
          } else if (tempModelYearValue.isNotEmpty) {
            int tempModelYear = int.parse(tempModelYearValue);
            if (tempModelYear >= 85 || tempModelYear <= 71) {
              modelYearHinFormatResult = false;
              getAlertMethod(
                  'Check Model Year Format digits 10 & 11:\nValid Years are 72 to 84.\nCheck formats on Info Page.\nClear HIN and try again.');
            } else if (tempModelYear >= 72 || tempModelYear <= 84 && modelYearMonth) {
              modelYearHinFormatResult = true;
              getAlertMethod('Correct - Model Year Format');
            }
          }
        }
      }
    }

    RegExp currentHinFormatRegExp =
        RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[a-lA-L]\d{3}$');
    bool currentHinYearFormatResult = currentHinFormatRegExp.hasMatch(userInputHin);
    if (currentHinYearFormatResult) {
      String tempCurrentHinYearValue = userInputHin.substring(10, 12);
      if (tempCurrentHinYearValue.isNotEmpty) {
        int tempCurrentHinYear = int.parse(tempCurrentHinYearValue);
        if (tempCurrentHinYear >= 84 && tempCurrentHinYear <= 99) {
          // 84 to 99 corresponds to years 1984 to 1999
          tempCurrentHinYear += 1900;
        } else {
          // 00 to 99 corresponds to years 2000 to 2099
          tempCurrentHinYear += 2000;
        }
        // Check the model year range
        if (tempCurrentHinYear >= 1984 && tempCurrentHinYear <= DateTime.now().year) {
          currentHinYearFormatResult = true;
          getAlertMethod('Correct - Current HIN Format');
        } else {
          currentHinYearFormatResult = false;
          getAlertMethod(
              'Error! Check the last 2 digits.\nThis format years are 84 to present.\nCheck formats on Info Page.\nClear HIN and try again.');
        }
      }
    } // if current HIN
    if (!modelYearHinFormatResult && !straightYearHinFormatResult && !currentHinYearFormatResult) {
      getAlertMethod(
          'Not a valid entry!\nClear HIN and try again.\nCheck Info page for correct formats.');
    }
  }

  void checkUserHinEntryLength(String userHinEntry) {
    if (userHinEntry.length != 12 || userHinEntry.isEmpty) {
      getAlertMethod('HIN is 12 digits long.\nCheck formats on Info Page and try again.');
    }
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
} //class
