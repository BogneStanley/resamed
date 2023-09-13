import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/main.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/presentation/common/widgets/field/custom_text_form_field.dart';
import 'package:hospital/presentation/login/controller/login_controller.dart';
import 'package:hospital/presentation/login/controller/login_state.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/form_validator.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LayoutController layoutController =
        ref.read(layoutControllerProvider.notifier);

    LoginController controller = ref.read(loginControllerProvider.notifier);
    controller.context = context;
    var pb = ref.watch(pbClientProvider);
    LoginState state = ref.watch(loginControllerProvider);
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
                  CTextFormField(
                    hintText: "Email",
                    controller: controller.emailController,
                    validator: (p0) => FormValidator(p0, "Email")
                        .isRequired()
                        .email()
                        .validate(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CTextFormField(
                    hintText: "Mot de passe",
                    controller: controller.passwordController,
                    validator: (p0) => FormValidator(p0, "Mot de passe")
                        .isRequired()
                        .password()
                        .validate(),
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CButton(
                    label: "Se connecter",
                    isLoading: state.loginInProgress,
                    onPressed: () async {
                      // layoutController.changePageIndex(0);
                      // context.router.replaceAll([const LayoutRoute()]);
                      // final body = <String, dynamic>{
                      //   "username": "test_username",
                      //   "email": "user1@resamed.cm",
                      //   "emailVisibility": true,
                      //   "password": "12345678",
                      //   "passwordConfirm": "12345678",
                      //   "firstname": "user1",
                      //   "lastname": "user",
                      //   "phone": "+237676168616",
                      //   "address": "Cradat, Yaoundé, cameroun",
                      //   "birthday": "2022-01-20 10:00:00.123Z",
                      //   "gender": "man",
                      //   "type": "medecin",
                      //   "medecin_info": {
                      //     "type": "generalist",
                      //     "career_start_date": "2022-01-01 10:00:00.123Z",
                      //     "licence_number": "test",
                      //     "isValided": true,
                      //   }
                      // };

                      // final record =
                      //     await pb.collection('users').create(body: body);

                      controller.login();
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
      ),
    );
  }
}
