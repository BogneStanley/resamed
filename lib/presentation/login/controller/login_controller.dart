import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/main.dart';
import 'package:hospital/tools/error_display.dart';
import 'package:hospital/tools/g_tools.dart';
import 'package:pocketbase/pocketbase.dart';

import 'login_state.dart';

var loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) =>
      LoginController(LoginState.initialize(), pb: ref.read(pbClientProvider)),
);

class LoginController extends StateNotifier<LoginState> {
  PocketBase pb;
  LoginController(
    super.state, {
    required this.pb,
  });
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  late BuildContext context;

  login() async {
    if (formKey.currentState!.validate()) {
      try {
        state = state.copyWith(loginInProgress: true);

        var res = await pb.collection("users").authWithPassword(
            emailController.text, passwordController.text,
            expand: "medecin_info");

        logger.d(res.toJson());
      } on ClientException catch (e) {
        GTools.clientExceptionErrorDisplay(e, context);
      } catch (e) {
        ErrorDisplay.fromCode(context, 400, e.toString());
      } finally {
        state = state.copyWith(loginInProgress: false);
      }
    }
  }

  initializeState() {
    emailController.text = "";
    passwordController.text = "";
    state = LoginState.initialize();
  }
}
