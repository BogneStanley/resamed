import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/res/colors.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';

@RoutePage()
class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
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
                context.router.replaceAll([const LoginRoute()]);
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
