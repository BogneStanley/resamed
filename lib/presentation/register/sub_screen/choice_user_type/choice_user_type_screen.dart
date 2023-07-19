import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';
import 'package:hospital/router/app_route.gr.dart';
import 'package:hospital/tools/extensions.dart';

@RoutePage()
class ChoiceUserTypeScreen extends HookConsumerWidget {
  const ChoiceUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LayoutController layoutController =
        ref.read(layoutControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Selectionner le type \nde compte",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            20.ph,
            CButton(
              label: "Simple utilisateur",
              onPressed: () {
                layoutController.changePageIndex(0);
                context.router.replaceAll([const LayoutRoute()]);
              },
            ),
            10.ph,
            CButton(
              label: "Médecin",
              onPressed: () {
                context.router.push(const DoctorInfoRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}
