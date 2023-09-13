import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';

import 'package:hospital/data/pb_client.dart';
import 'package:hospital/main.dart';
import 'package:hospital/presentation/common/dialogs/message/message_dialog.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/error_display.dart';
import 'package:hospital/tools/g_tools.dart';

import 'register_state.dart';

var registerControllerProvider =
    StateNotifierProvider<RegisterController, RegisterState>(
  (ref) => RegisterController(RegisterState.initialize(),
      pb: ref.read(pbClientProvider)),
);

class RegisterController extends StateNotifier<RegisterState> {
  PocketBase pb;
  RegisterController(
    super.state, {
    required this.pb,
  });
  late PageController pageController;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController carrerStartDateController = TextEditingController();
  TextEditingController medecinTypeController = TextEditingController();
  TextEditingController licenceNumberController = TextEditingController();
  TextEditingController studyCertificateController = TextEditingController();
  TextEditingController privatePracticeLicenseController =
      TextEditingController();
  TextEditingController affiliateHospitalController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> doctorInfoFormKey = GlobalKey();
  late BuildContext context;

  register() async {
    if (formKey.currentState!.validate()) {
      logger.i("Register");
      try {
        var record = await pb.collection("users").create(body: {
          "firstname": firstnameController.text,
          "lastname": lastnameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "passwordConfirm": confirmPasswordController.text,
          "phone": phoneController.text,
          "address": addressController.text,
          "birthday": birthdayController.text,
          "gender": genderController.text,
          "type": "simple_user"
        });

        var res = await pb
            .collection("users")
            .authWithPassword(emailController.text, passwordController.text);

        context.router.replace(const ChoiceUserTypeRoute());

        logger.d(res.toJson());
      } on ClientException catch (e, s) {
        GTools.clientExceptionErrorDisplay(e, context);
      }
    }
  }

  becomeMedecin() async {
    logger.i(pb.authStore.model);
    context.router.replace(const DoctorInfoRoute());
  }

  createMedecinInfo() async {
    var user = RecordModel.fromJson(jsonDecode(pb.authStore.model.toString()));

    if (doctorInfoFormKey.currentState!.validate()) {
      try {
        state = state.copyWith(creatingMedecinInfoInProgress: true);
        if (user.getStringValue("type") != 'medecin') {
          await pb.collection("users").update(
            (jsonDecode(pb.authStore.model.toString()) as Map)["id"],
            body: {"type": "medecin"},
          );
        }
        var record = await pb.collection("medecin_info").create(
          body: {
            "type": medecinTypeController.text,
            "career_start_date": carrerStartDateController.text,
            "licence_number": licenceNumberController.text,
            "isValided": false,
          },
          files: [
            await http.MultipartFile.fromPath(
              "study_certificate",
              state.studyCertificateFile!.path,
            ),
            if (state.privatePracticeLicenseFile?.path != null)
              await http.MultipartFile.fromPath(
                "private_practice_license",
                state.privatePracticeLicenseFile!.path,
              ),
          ],
        );
        pb.collection("users").update(
          (jsonDecode(pb.authStore.model.toString()) as Map)["id"],
          body: {"medecin_info": record.id},
        );
        context.router.pop();
        logger.d(record);
      } on ClientException catch (e) {
        GTools.clientExceptionErrorDisplay(e, context);
      } finally {
        state = state.copyWith(creatingMedecinInfoInProgress: false);
      }
    }
  }

  setStudyCertificateFile(File file) {
    state = state.copyWith(studyCertificateFile: file);
  }

  setPrivatePracticeLicenseFile(File file) {
    state = state.copyWith(privatePracticeLicenseFile: file);
  }

  // set all TextEditingControllers to empty
  clearTextEditingControllers() {
    firstnameController.text = "";
    lastnameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    confirmPasswordController.text = "";
    phoneController.text = "";
    addressController.text = "";
    birthdayController.text = "";
    genderController.text = "";
    carrerStartDateController.text = "";
    medecinTypeController.text = "";
    licenceNumberController.text = "";
    studyCertificateController.text = "";
    privatePracticeLicenseController.text = "";
    affiliateHospitalController.text = "";
  }
}
