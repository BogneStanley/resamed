import 'package:hospital/model/consultation.dart';
import 'package:hospital/model/medecin.dart';
import 'package:pocketbase/pocketbase.dart';

class ConsultationState {
  ConsultationState(
      {this.currenChoiceMedecin,
      required this.reservationInProgress,
      required this.consultations,
      required this.consultationLoading});
  MedecinModel? currenChoiceMedecin;
  ConsultationListModel consultations;
  bool consultationLoading;
  bool reservationInProgress;
  factory ConsultationState.initialize() {
    return ConsultationState(
      reservationInProgress: false,
      consultationLoading: false,
      consultations: ConsultationListModel(consultations: []),
    );
  }

  ConsultationState copyWith(
      {MedecinModel? currenChoiceMedecin,
      bool? reservationInProgress,
      ConsultationListModel? consultations,
      bool? consultationLoading}) {
    return ConsultationState(
        currenChoiceMedecin: currenChoiceMedecin ?? this.currenChoiceMedecin,
        reservationInProgress:
            reservationInProgress ?? this.reservationInProgress,
        consultations: consultations ?? this.consultations,
        consultationLoading: consultationLoading ?? this.consultationLoading);
  }
}
