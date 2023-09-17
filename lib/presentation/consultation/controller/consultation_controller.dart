import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/flutter_tools_extended/x_text_editing_controller.dart';
import 'package:hospital/main.dart';
import 'package:hospital/model/consultation.dart';
import 'package:hospital/model/medecin.dart';
import 'package:hospital/presentation/common/dialogs/message/message_dialog.dart';
import 'package:hospital/tools/g_tools.dart';
import 'package:hospital/tools/name_to_avatar.dart';
import 'package:pocketbase/pocketbase.dart';

import 'consultation_state.dart';

var consultationControllerProvider =
    StateNotifierProvider<ConsultationController, ConsultationState>(
  (ref) => ConsultationController(ConsultationState.initialize(),
      pb: ref.read(pbClientProvider)),
);

class ConsultationController extends StateNotifier<ConsultationState> {
  PocketBase pb;
  ConsultationController(
    super.state, {
    required this.pb,
  }) {
    init();
  }
  late BuildContext context;
  GlobalKey<FormState> reservationFormKey = GlobalKey<FormState>();

  XTextEditingController medecinController = XTextEditingController();
  TextEditingController consultationDateController = TextEditingController();
  XTextEditingController consultationTypeController = XTextEditingController();
  TextEditingController consultationMotifController = TextEditingController();
  TextEditingController consultationLocationController =
      TextEditingController();
  TextEditingController consultationPhoneController = TextEditingController();

  init() {
    loadConsultationFromApi();
    pb.collection("consultation").subscribe(
      "*",
      (e) async {
        if (e.record == null) {
          return;
        }
        if (e.action == "create") {
          return;
        }
        bool recordIsPresent = false;

        ConsultationListModel consults = state.consultations
          ..consultations?.map((consult) {
            if (consult.id == e.record!.id) {
              recordIsPresent = true;
              return e.record!;
            }
            return consult;
          }).toList();
        if (recordIsPresent) {
          state.consultations.consultations = consults.consultations;
          state = state.copyWith();
        } else {
          var rec = await pb.collection("consultation").getOne(e.record!.id,
              expand: "medecin.medecin_info,patient,type");
          state = state.copyWith(
              consultations: state.consultations
                ..consultations?.add(ConsultationModel.fromMap(rec.toJson())));
        }
      },
    );
  }

  Future<List<RecordModel>> getMedecin() async {
    final records = await pb.collection('medecin').getFullList(
          sort: '-created',
          filter: 'id != ${pb.authStore.model.id}',
        );
    return records;
  }

  setCurrentChoiceMedecin(MedecinModel medecin) {
    state = state.copyWith(currenChoiceMedecin: medecin);
  }

  initializeState() {
    state = ConsultationState.initialize();
  }

  loadConsultationFromApi() async {
    try {
      state = state.copyWith(consultationLoading: true);
      final records = await pb.collection('consultation').getList(
            perPage: 100,
            sort: '-created',
            expand: 'patient,medecin.medecin_info,type',
          );
      logger.i(records.toJson());
      state = state.copyWith(
          consultations: ConsultationListModel.fromMap(records.toJson()));
    } on ClientException catch (e) {
      GTools.clientExceptionErrorDisplay(e, context);
    } finally {
      state = state.copyWith(consultationLoading: false);
    }
  }

  bookConsultation() async {
    if (!reservationFormKey.currentState!.validate()) {
      return;
    }
    state = state.copyWith(reservationInProgress: true);
    try {
      await pb.collection("consultation").create(body: {
        "consultation_date": '${consultationDateController.text}:00.000Z',
        "patient": pb.authStore.model.id,
        "medecin": medecinController.payload.id,
        "reason": consultationMotifController.text,
        "phone": consultationPhoneController.text,
        "resident_location": consultationLocationController.text,
        "type": consultationTypeController.payload.id,
      });
      MessageDialog.alert(
        type: DialogType.success,
        context: context,
        message: "Votre réservation a bien été prise en compte",
      );
    } on ClientException catch (e) {
      GTools.clientExceptionErrorDisplay(e, context);
    } finally {
      state = state.copyWith(reservationInProgress: false);
    }
    loadConsultationFromApi();
  }

  removeReservation(String reservationId) async {
    bool errorOccured = false;
    try {
      state = state.copyWith(consultationLoading: true);
      await pb.collection("consultation").delete(reservationId);
    } on ClientException catch (e) {
      GTools.clientExceptionErrorDisplay(e, context);
      errorOccured = true;
    } finally {
      state = state.copyWith(consultationLoading: false);
    }
    if (!errorOccured) {
      loadConsultationFromApi();
    }
  }

  clearAllTextEditingControllers() {
    consultationDateController.clear();
    consultationTypeController.clear();
    consultationMotifController.clear();
    consultationLocationController.clear();
    consultationPhoneController.clear();
    medecinController.clear();
  }
}
