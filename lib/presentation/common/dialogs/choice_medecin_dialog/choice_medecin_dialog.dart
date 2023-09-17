import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/main.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/model/medecin.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/tools/extensions.dart';
import 'package:hospital/tools/name_to_avatar.dart';

import 'choice_medecin_provider.dart';

Future<MedecinModel?> showChoiceMedecinDialog(BuildContext context) async {
  return await showDialog<MedecinModel>(
    context: context,
    barrierColor: Colors.white,
    builder: (context) {
      return ChoiceMedecinDialog();
    },
  );
}

class ChoiceMedecinDialog extends HookConsumerWidget {
  const ChoiceMedecinDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var medecins = ref.watch(medecinProvider);

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
              ref.invalidate(medecinProvider);
            },
            child: medecins.when(
              data: (medecinList) {
                logger.d(medecins);
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Choisir un médecin",
                        style: TextStyle(fontSize: 18)),
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
                          if (medecinList.isEmpty)
                            Expanded(
                              child: Center(
                                child: Text("Aucun médecin"),
                              ),
                            )
                          else
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      context.router.pop(medecinList[index]);
                                    },
                                    leading: (medecinList[index]
                                                .avatar
                                                ?.isNotEmpty ??
                                            false)
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              medecinList[index].avatar!,
                                              width: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : buildAvatar(
                                            medecinList[index].firstname,
                                            medecinList[index].lastname),
                                    title: Text(
                                        "Dr. ${medecinList[index].firstname} ${medecinList[index].lastname}"),
                                    subtitle: IntrinsicWidth(
                                      child: Row(
                                        children: [
                                          Card(
                                            elevation: 0,
                                            color: AppColors.primary
                                                .withOpacity(0.1),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 8),
                                              child: Text(
                                                  medecinList[index]
                                                      .typeFormatted,
                                                  style: const TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize: 10,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: medecinList.length,
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
                    medecins = ref.refresh(medecinProvider);
                    logger.d(medecins);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ));
  }
}
