import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/main.dart';
import 'package:hospital/model/consultation_type.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/tools/extensions.dart';

import 'choice_consultation_type_provider.dart';

Future<ConsultationTypeModel?> showChoiceConsultationTypeDialog(
    BuildContext context) async {
  return await showDialog<ConsultationTypeModel>(
    context: context,
    barrierColor: Colors.white,
    builder: (context) {
      return ChoiceConsultationTypeDialog();
    },
  );
}

class ChoiceConsultationTypeDialog extends HookConsumerWidget {
  const ChoiceConsultationTypeDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var consultationTypes = ref.watch(consultationTypeProvider);

    return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
              ref.invalidate(consultationTypeProvider);
            },
            child: consultationTypes.when(
              data: (consultationTypeList) {
                logger.d(consultationTypes);
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Choisir un type de consultation",
                        style: TextStyle(fontSize: 14)),
                  ),
                  body: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.ph,
                          CTextFormField(
                            surfixIcon: Icon(Icons.search),
                            hintText: "Recherche...",
                          ),
                          10.ph,
                          if (consultationTypeList.isEmpty)
                            Expanded(
                              child: Center(
                                child: Text("Aucun Type de consultation"),
                              ),
                            )
                          else
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      tileColor: AppColors.randomColor()
                                          .withOpacity(0.05),
                                      onTap: () {
                                        context.router
                                            .pop(consultationTypeList[index]);
                                      },
                                      title: Text(
                                          "${consultationTypeList[index].label}"),
                                    ),
                                  );
                                },
                                itemCount: consultationTypeList.length,
                              ),
                            ),
                        ]),
                  ),
                );
              },
              error: (error, stackTrace) {
                return GestureDetector(
                  child: Text(error.toString()),
                  onTap: () {
                    consultationTypes = ref.refresh(consultationTypeProvider);
                    logger.d(consultationTypes);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ));
  }
}
