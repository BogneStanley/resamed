import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/common/widgets/button/custom_button.dart';

import 'controller/consultation_controller.dart';
import 'controller/consultation_state.dart';

@RoutePage()
class ConsultationScreen extends HookConsumerWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ConsultationController controller =
        ref.read(consultationControllerProvider.notifier);
    controller.context = context;
    ConsultationState state = ref.watch(consultationControllerProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child: CButton(
              label: "Réserver une consultation",
              onPressed: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "Historique",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Aucune Consultation\neffectuée",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
