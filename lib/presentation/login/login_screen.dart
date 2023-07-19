import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/router/app_route.gr.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

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
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Connexion",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CTextFormField(
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                const CTextFormField(
                  hintText: "Mot de passe",
                  isPassword: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                CButton(
                  label: "Se connecter",
                  onPressed: () {
                    layoutController.changePageIndex(0);
                    context.router.replaceAll([const LayoutRoute()]);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Pas de compte ?"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                CButton(
                  label: "Créer un compte",
                  bgColor: const Color.fromARGB(255, 245, 244, 248),
                  labelColor: Colors.black,
                  onPressed: () {
                    context.router.push(const RegisterRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
