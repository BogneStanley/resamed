import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/main.dart';
import 'package:pocketbase/pocketbase.dart';

import 'settings_state.dart';

var settingsControllerProvider =
    StateNotifierProvider<SettingsController, SettingsState>(
  (ref) => SettingsController(SettingsState.initialize(),
      pb: ref.read(pbClientProvider)),
);

class SettingsController extends StateNotifier<SettingsState> {
  PocketBase pb;
  SettingsController(
    super.state, {
    required this.pb,
  }) {
    init();
  }
  late BuildContext context;

  init() async {
    if ((pb.authStore.model as RecordModel).getStringValue("type") ==
        "simple_user") {
      state.isMedecin = (false);
    } else {
      state.isMedecin = (true);
      if ((pb.authStore.model as RecordModel)
              .expand["medecin_info"]
              ?.first
              .getBoolValue('isValided') ??
          false) {
        state.medecinInfoIsValidate = (true);
      }
    }
    pb.collection('users').subscribe(
      (pb.authStore.model as RecordModel).id,
      (e) {
        logger.i(e.action);
        logger.i(e.record);
        if (e.record == null) {
          return;
        }
        if (e.record!.getStringValue("type") == "simple_user") {
          setIsMedecin(false);
        } else {
          setIsMedecin(true);
        }
      },
    );
    pb.collection('medecin_info').subscribe(
      (pb.authStore.model as RecordModel).getStringValue("medecin_info"),
      (e) {
        logger.i(e.action);
        logger.i(e.record);
        if (e.record == null) {
          return;
        }
        setMedecinInfoIsValidate(e.record!.getBoolValue('isValided'));
      },
    );
  }

  setMedecinInfoIsValidate(bool value) {
    state = state.copyWith(
      medecinInfoIsValidate: value,
    );
  }

  setIsMedecin(bool value) {
    state = state.copyWith(
      isMedecin: value,
    );
  }
}
