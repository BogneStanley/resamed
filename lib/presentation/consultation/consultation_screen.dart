import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/model/consultation.dart';
import 'package:hospital/presentation/common/widgets/badge/custom_badge.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';
import 'package:hospital/tools/helpers.dart';
import 'package:hospital/tools/name_to_avatar.dart';

import 'controller/consultation_controller.dart';
import 'controller/consultation_state.dart';

@RoutePage()
class ConsultationScreen extends HookConsumerWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ConsultationController controller =
        ref.read(consultationControllerProvider.notifier);
    controller.context = context;
    ConsultationState state = ref.watch(consultationControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: (!state.consultationLoading)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ((state.consultations.totalItems ?? 0) == 0)
                      ? const Center(
                          child: Text(
                            "Aucune Consultation\neffectuée",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await controller.loadConsultationFromApi();
                          },
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              ConsultationModel? consult =
                                  state.consultations.consultations?[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ExpansionTile(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  collapsedBackgroundColor: Colors.white,
                                  childrenPadding: const EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color:
                                            AppColors.primary.withOpacity(0.5),
                                      )),
                                  title: Text(customDateFormat(
                                      consult?.consultation_date)),
                                  subtitle: Row(
                                    children: [
                                      CustomBadge(
                                        text:
                                            consult?.expand?.type?.label ?? '',
                                        size: 12,
                                        color:
                                            AppColors.primary.withOpacity(0.1),
                                        textColor:
                                            Color.fromARGB(255, 7, 72, 83),
                                      ),
                                    ],
                                  ),
                                  trailing: Badge(
                                    smallSize: 18,
                                    backgroundColor:
                                        !(consult?.isAccepted ?? false)
                                            ? Colors.orange
                                            : Colors.green,
                                  ),
                                  children: [
                                    Row(children: [
                                      (consult?.expand?.medecin?.avatar
                                                  ?.isNotEmpty ??
                                              false)
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.network(
                                                consult!.expand!.medecin!
                                                    .avatarFormat()!,
                                                width: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : buildAvatar(
                                              consult?.expand?.medecin
                                                      ?.firstname ??
                                                  "",
                                              consult?.expand?.medecin
                                                      ?.lastname ??
                                                  ""),
                                      10.pw,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Dr. ${consult?.expand?.medecin?.firstname ?? ""} ${consult?.expand?.medecin?.lastname ?? ""}'),
                                            CustomBadge(
                                              color: AppColors.primary
                                                  .withOpacity(0.1),
                                              size: 12,
                                              text: consult
                                                      ?.expand
                                                      ?.medecin
                                                      ?.expand
                                                      ?.medecin_info
                                                      ?.type ??
                                                  "",
                                              textColor: Color.fromARGB(
                                                  255, 7, 72, 83),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                                    10.ph,
                                    if (consult?.reason?.isNotEmpty ?? false)
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 60,
                                              child: Text(
                                                "Motifs :",
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                            10.pw,
                                            Expanded(
                                              child:
                                                  Text(consult?.reason ?? ""),
                                            )
                                          ]),
                                    10.ph,
                                    10.ph,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (!(consult?.isAccepted ?? false))
                                          CustomBadge(
                                              text:
                                                  "Votre reservation est en attende",
                                              size: 14,
                                              color: Colors.orange
                                                  .withOpacity(0.1),
                                              textColor: Colors.brown)
                                        else
                                          CustomBadge(
                                              text: "Accepté par le médecin",
                                              size: 14,
                                              color:
                                                  Colors.green.withOpacity(0.1),
                                              textColor: const Color.fromARGB(
                                                  255, 21, 78, 23))
                                      ],
                                    ),
                                    5.ph,
                                    CButton(
                                      label: "Annuler la reservation",
                                      onPressed: () {
                                        controller.removeReservation(
                                            consult?.id ?? "");
                                      },
                                      bgColor: Color.fromARGB(255, 255, 77, 64),
                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount:
                                state.consultations.consultations?.length ?? 0,
                          ),
                        ),
                ),
                BottomAppBar(
                  color: Colors.white,
                  elevation: 0,
                  child: CButton(
                    label: "Réserver une consultation",
                    onPressed: () {
                      //ref.invalidate(consultationControllerProvider);
                      context.router.push(const ReservationRoute());
                    },
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
