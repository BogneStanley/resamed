import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';

@RoutePage()
class DoctorInfoScreen extends HookConsumerWidget {
  const DoctorInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LayoutController layoutController =
        ref.read(layoutControllerProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.ph,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Information supplémentaire \npour médécin",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                30.ph,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButtonFormField(
                    hint: const Text("Type de médecin"),
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(minHeight: 50),
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.05),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "e",
                        child: Text("Généraliste"),
                      ),
                      DropdownMenuItem(
                        value: "e2",
                        child: Text("Spécialiste"),
                      )
                    ],
                    elevation: 2,
                    onChanged: (value) {},
                  ),
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Date de début de carrière",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Numéro de licence",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Certificat d'étude",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Autorisation de pratique privée (faciltative)",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Document supplémentaire (facultative)",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Hôpital affilier (facultative)",
                ),
                10.ph,
                CButton(
                  label: "Envoyer",
                  onPressed: () {
                    layoutController.changePageIndex(0);
                    context.router.replaceAll([const LayoutRoute()]);
                  },
                ),
                30.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
