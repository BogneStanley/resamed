import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';

@RoutePage()
class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                const CTextFormField(
                  hintText: "Nom",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Prenom",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Email",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Téléphone",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Adresse",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Date de naissance",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Sexe",
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Mot de passe",
                  isPassword: true,
                ),
                10.ph,
                const CTextFormField(
                  hintText: "Confirmer le Mot de passe",
                  isPassword: true,
                ),
                40.ph,
                CButton(
                  label: "Créer un compte",
                  onPressed: () {
                    context.router.push(const ChoiceUserTypeRoute());
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
    );
  }
}
