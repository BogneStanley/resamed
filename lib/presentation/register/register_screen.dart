import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';
import 'package:hospital/tools/form_validator.dart';

import 'controller/register_controller.dart';

@RoutePage()
class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.read(registerControllerProvider.notifier);
    controller.context = context;
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
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  10.ph,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "S'enregistrer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  30.ph,
                  CTextFormField(
                    hintText: "Nom",
                    controller: controller.lastnameController,
                    validator: (value) =>
                        FormValidator(value, "Nom").isRequired().validate(),
                  ),
                  10.ph,
                  CTextFormField(
                      hintText: "Prenom",
                      controller: controller.firstnameController,
                      validator: (value) => FormValidator(value, "Prenom")
                          .isRequired()
                          .validate()),
                  10.ph,
                  CTextFormField(
                    hintText: "Email",
                    controller: controller.emailController,
                    validator: (value) => FormValidator(value, "Email")
                        .isRequired()
                        .email()
                        .validate(),
                  ),
                  10.ph,
                  CTextFormField(
                    hintText: "Téléphone",
                    controller: controller.phoneController,
                    validator: (value) => FormValidator(value, "Téléphone")
                        .isRequired()
                        .phone()
                        .validate(),
                  ),
                  10.ph,
                  CTextFormField(
                    hintText: "Adresse",
                    controller: controller.addressController,
                    validator: (value) =>
                        FormValidator(value, "Adresse").isRequired().validate(),
                  ),
                  10.ph,
                  CTextFormField.date(
                    context,
                    hintText: "Date de naissance",
                    controller: controller.birthdayController,
                    validator: (value) =>
                        FormValidator(value, "Date de naissance")
                            .isRequired()
                            .validate(),
                  ),
                  10.ph,
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        value: "man",
                        child: Text("Homme"),
                      ),
                      DropdownMenuItem(
                        value: "woman",
                        child: Text("Femme"),
                      )
                    ],
                    validator: (value) =>
                        FormValidator(value, "Sexe").isRequired().validate(),
                    onChanged: (value) {
                      controller.genderController.text = value ?? "";
                    },
                    decoration: InputDecoration(
                      constraints: BoxConstraints(minHeight: 50),
                      hintText: "Sexe",
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.05),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  10.ph,
                  CTextFormField(
                    hintText: "Mot de passe",
                    controller: controller.passwordController,
                    isPassword: true,
                    validator: (value) => FormValidator(value, "Mot de passe")
                        .isRequired()
                        .password()
                        .validate(),
                  ),
                  10.ph,
                  CTextFormField(
                    hintText: "Confirmer le Mot de passe",
                    controller: controller.confirmPasswordController,
                    isPassword: true,
                    validator: (value) => FormValidator(value, "Mot de passe")
                        .isRequired()
                        .confirmPassword(controller.passwordController.text)
                        .validate(),
                  ),
                  40.ph,
                  CButton(
                    label: "Créer un compte",
                    onPressed: () {
                      controller.register();
                      //context.router.push(const ChoiceUserTypeRoute());
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Déjà inscrit ?"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                  ),
                  CButton(
                    label: "Se connecter",
                    bgColor: const Color.fromARGB(255, 245, 244, 248),
                    labelColor: Colors.black,
                    onPressed: () {
                      context.router.replaceAll([const LoginRoute()]);
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
