import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../models/mic_data_model.dart';
import '../../repositories/mic_repository.dart';

part 'mic_data_state.dart';

class MicDataCubit extends Cubit<MicDataState> {
  final MicRepository repository;

  MicDataCubit({required this.repository}) : super(InitialState()) {
    getUserEnteredMicData('111');
  }

  void getUserEnteredMicData(String userEnteredHinMic) async {
    // debugPrint('userEnteredHinMic: $userEnteredHinMic');
    bool validMicFromHinResult = true;
    String userInputValidatedMic = '111';
    List<MicDataModel>;
    // RegExp straightYearHinFormatRegExp =
    //     RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}(0[1-9]|1[0-2])\d+$');
    // RegExp modelYearHinFormatRegExp =
    //     RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[Mm]\d{2}[a-lA-L]$');
    // RegExp currentHinFormatRegExp =
    //     RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[a-lA-L]\d{3}$');

    RegExp straightYearHinFormatRegExp =
        RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}(0[1-9]|1[0-2])\d+$');
    bool straightYearHinFormatResult = straightYearHinFormatRegExp.hasMatch(userEnteredHinMic);
    if (straightYearHinFormatResult) {
      String tempStraightYearMicValue = userEnteredHinMic.substring(0, 3);
      validMicFromHinResult = true;
      userInputValidatedMic = tempStraightYearMicValue;
    } //straightYearHinFormatResult
    RegExp modelYearHinFormatRegExp =
        RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[Mm]\d{2}[a-lA-L]$');
    bool modelYearHinFormatResult = modelYearHinFormatRegExp.hasMatch(userEnteredHinMic);
    if (modelYearHinFormatResult) {
      String tempModelYearMicValue = userEnteredHinMic.substring(0, 3);
      validMicFromHinResult = true;
      userInputValidatedMic = tempModelYearMicValue;
    } //modelYearHinFormatResult

    RegExp currentHinFormatRegExp =
        RegExp(r'^[4a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z0-9]{5}[a-lA-L]\d{3}$');
    bool currentFormatHinFormatResult = currentHinFormatRegExp.hasMatch(userEnteredHinMic);
    if (currentFormatHinFormatResult) {
      String tempCurrentFormatMicValue = userEnteredHinMic.substring(0, 3);
      validMicFromHinResult = true;
      userInputValidatedMic = tempCurrentFormatMicValue;
    } //modelYearHinFormatResult

    if (validMicFromHinResult) {
      try {
        emit(
          LoadingState(),
        );
        debugPrint('userInputValidatedMic: $userInputValidatedMic');
        final validatedMic = await repository.getMicData(userInputValidatedMic);
        // debugPrint(' in validMicFromHinResult after validatedMic: $validatedMic');
        emit(LoadedState(validatedMic));
      } catch (e) {
        // debugPrint('in MicDataCubit and this is the error: $e');
        emit(ErrorState());
      }
    }
  }
}
