import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/template_controller.dart';
import 'controller/template_state.dart';

@RoutePage()
class TemplateScreen extends HookConsumerWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    TemplateController controller =
        ref.read(templateControllerProvider.notifier);
    controller.context = context;
    TemplateState state = ref.watch(templateControllerProvider);
    return Scaffold();
  }
}
