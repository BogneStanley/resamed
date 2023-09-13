import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/presentation/register/controller/register_controller.dart';
import 'package:hospital/presentation/register/controller/register_state.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';
import 'package:hospital/tools/form_validator.dart';

@RoutePage()
class DoctorInfoScreen extends ConsumerStatefulWidget {
  const DoctorInfoScreen({super.key});

  @override
  ConsumerState<DoctorInfoScreen> createState() => _DoctorInfoScreenState();
}

class _DoctorInfoScreenState extends ConsumerState<DoctorInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(registerControllerProvider.notifier).clearTextEditingControllers();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LayoutController layoutController =
        ref.read(layoutControllerProvider.notifier);
    RegisterController registerController =
        ref.read(registerControllerProvider.notifier);
    RegisterState registerState = ref.watch(registerControllerProvider);
    registerController.context = context;
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
            child: Form(
              key: registerController.doctorInfoFormKey,
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
                      validator: (value) =>
                          FormValidator(value, "Type de medecin")
                              .isRequired()
                              .validate(),
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
                          value: "generalist",
                          child: Text("Généraliste"),
                        ),
                        DropdownMenuItem(
                          value: "specialist",
                          child: Text("Spécialiste"),
                        )
                      ],
                      elevation: 2,
                      onChanged: (value) {
                        registerController.medecinTypeController.text =
                            value ?? "";
                      },
                    ),
                  ),
                  10.ph,
                  CTextFormField.date(
                    context,
                    validator: (value) =>
                        FormValidator(value, "Date de début de carrière")
                            .isRequired()
                            .validate(),
                    controller: registerController.carrerStartDateController,
                    hintText: "Date de début de carrière",
                  ),
                  10.ph,
                  CTextFormField(
                    hintText: "Numéro de licence",
                    validator: (value) =>
                        FormValidator(value, "Numéro de licence")
                            .isRequired()
                            .validate(),
                    controller: registerController.licenceNumberController,
                  ),
                  10.ph,
                  CTextFormField(
                    readOnly: true,
                    validator: (value) =>
                        FormValidator(value, "Certificat d'étude")
                            .isRequired()
                            .validate(),
                    controller: registerController.studyCertificateController,
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null && result.files.single.path != null) {
                        File file = File(result.files.single.path!);
                        registerController.studyCertificateController.text =
                            result.names.first ?? "";
                        registerController.setStudyCertificateFile(file);
                      } else {
                        // User canceled the picker
                      }
                    },
                    hintText: "Certificat d'étude",
                  ),
                  10.ph,
                  CTextFormField(
                    readOnly: true,
                    controller:
                        registerController.privatePracticeLicenseController,
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null && result.files.single.path != null) {
                        File file = File(result.files.single.path!);
                        registerController.privatePracticeLicenseController
                            .text = result.names.first ?? "";
                        registerController.setPrivatePracticeLicenseFile(file);
                      } else {
                        // User canceled the picker
                      }
                    },
                    hintText: "Autorisation de pratique privée (faciltative)",
                  ),
                  10.ph,
                  const CTextFormField(
                    readOnly: true,
                    hintText: "Document supplémentaire (facultative)",
                  ),
                  10.ph,
                  CTextFormField(
                    controller: registerController.affiliateHospitalController,
                    hintText: "Hôpital affilier (facultative)",
                  ),
                  10.ph,
                  CButton(
                    label: "Envoyer",
                    isLoading: registerState.creatingMedecinInfoInProgress,
                    onPressed: () {
                      layoutController.changePageIndex(0);
                      registerController.createMedecinInfo();
                      //context.router.replaceAll([const LayoutRoute()]);
                    },
                  ),
                  30.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
