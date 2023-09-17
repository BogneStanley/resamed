import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/main.dart';
import 'package:hospital/presentation/common/dialogs/choice_consultation_type_dialog/choice_consultation_type_dialog.dart';
import 'package:hospital/presentation/common/dialogs/choice_medecin_dialog/choice_medecin_dialog.dart';
import 'package:hospital/presentation/common/widgets/button/c_icon_button.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/model/medecin.dart';
import 'package:hospital/tools/extensions.dart';
import 'package:hospital/tools/form_validator.dart';

import '../../../common/widgets/field/custom_text_form_field.dart';
import '../../controller/consultation_controller.dart';
import '../../controller/consultation_state.dart';

@RoutePage()
class ReservationScreen extends ConsumerStatefulWidget {
  const ReservationScreen({super.key});

  @override
  ConsumerState<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends ConsumerState<ReservationScreen> {
  @override
  void initState() {
    super.initState();
    ref
        .read(consultationControllerProvider.notifier)
        .clearAllTextEditingControllers();
  }

  @override
  Widget build(BuildContext context) {
    ConsultationController controller =
        ref.read(consultationControllerProvider.notifier);
    controller.context = context;
    ConsultationState state = ref.watch(consultationControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Form(
                key: controller.reservationFormKey,
                child: Column(
                  children: [
                    CTextFormField.date(
                      context,
                      withTime: true,
                      controller: controller.consultationDateController,
                      hintText: "Date de consultation",
                      validator: (p0) =>
                          FormValidator(p0, "Date").isRequired().validate(),
                    ),
                    5.ph,
                    CTextFormField(
                      onTap: () async {
                        var consultationType =
                            await showChoiceConsultationTypeDialog(context);
                        if (consultationType != null) {
                          controller.consultationTypeController.payload =
                              consultationType;
                          controller.consultationTypeController.text =
                              "${consultationType.label}";
                        }
                      },
                      controller: controller.consultationTypeController,
                      hintText: "Type de consultation",
                      readOnly: true,
                      surfixIcon: Icon(Icons.arrow_drop_down_rounded),
                      validator: (value) =>
                          FormValidator(value, "Type de consultation")
                              .isRequired()
                              .validate(),
                    ),
                    5.ph,
                    CTextFormField(
                      onTap: () async {
                        var medecin = await showChoiceMedecinDialog(context);
                        if (medecin != null) {
                          controller.medecinController.payload = medecin;
                          controller.medecinController.text =
                              "Dr. ${medecin.firstname} ${medecin.lastname}";
                        }
                      },
                      controller: controller.medecinController,
                      hintText: "Choisir un medecin",
                      readOnly: true,
                      surfixIcon: Icon(Icons.arrow_drop_down_rounded),
                      validator: (value) => FormValidator(value, "Medecin")
                          .isRequired()
                          .validate(),
                    ),
                    5.ph,
                    CTextFormField(
                      hintText: "Motif de consultation",
                      controller: controller.consultationMotifController,
                    ),
                    5.ph,
                    CTextFormField(
                        hintText: "Lieu de résidence",
                        controller: controller.consultationLocationController,
                        validator: (p0) =>
                            FormValidator(p0, "Lieu de résidence")
                                .isRequired()
                                .validate()),
                    5.ph,
                    CTextFormField(
                      hintText: "Numéro de téléphone",
                      controller: controller.consultationPhoneController,
                      validator: (p0) =>
                          FormValidator(p0, "Numéro de téléphone")
                              .isRequired()
                              .validate(),
                    )
                  ],
                ),
              ),
            )),
            10.ph,
            CButton(
              label: "Demandez un rendez vous",
              isLoading: state.reservationInProgress,
              onPressed: () {
                controller.bookConsultation();
              },
            ),
          ],
        ),
      ),
    );
  }
}
