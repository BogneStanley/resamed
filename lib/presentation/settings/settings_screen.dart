import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/main.dart';
import 'package:hospital/presentation/consultation/controller/consultation_controller.dart';
import 'package:hospital/presentation/exam/controller/exam_controller.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/login/controller/login_controller.dart';
import 'package:hospital/presentation/register/controller/register_controller.dart';
import 'package:hospital/presentation/settings/controller/settings_state.dart';
import 'package:hospital/presentation/settings/controller/settings_controller.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';
import 'package:pocketbase/pocketbase.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(settingsControllerProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    var pb = ref.watch(pbClientProvider);
    SettingsController controller =
        ref.read(settingsControllerProvider.notifier);
    SettingsState state = ref.watch(settingsControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            if (state.isMedecin)
              if (!state.medecinInfoIsValidate)
                ListTile(
                  title: const Text(
                    "Vos informations sont en cours de valisation",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 173, 130, 0)),
                  ),
                  tileColor: Colors.amber.withOpacity(0.1),
                )
              else
                ListTile(
                  trailing: Icon(Icons.verified, color: AppColors.primary),
                  title: const Text(
                    "Compte Médecin Vérifié",
                    style: TextStyle(color: Color.fromARGB(255, 36, 160, 182)),
                  ),
                  tileColor: AppColors.primary.withOpacity(0.1),
                ),
            if (!state.isMedecin)
              ListTile(
                onTap: () {
                  context.router.push(const DoctorInfoRoute());
                },
                title: const Text("Devenir médecin"),
                tileColor: Colors.white,
              ),
            10.ph,
            ListTile(
              onTap: () {
                //context.router.replaceAll([const LoginRoute()]);

                pb.authStore.clear();
                ref.invalidate(consultationControllerProvider);
                ref.invalidate(settingsControllerProvider);
                ref.invalidate(examControllerProvider);
                ref.invalidate(layoutControllerProvider);
                ref.invalidate(loginControllerProvider);
                ref.invalidate(registerControllerProvider);
                //logger.i(pb.authStore.token);
              },
              title: const Text(
                "Se déconnecter",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              trailing: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              tileColor: Colors.white,
            ),
          ]),
        ),
      ),
    );
  }
}
