import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/presentation/home/home_screen.dart';
import 'package:hospital/presentation/layout/controller/layout_controller.dart';
import 'package:hospital/presentation/layout/controller/layout_state.dart';
import 'package:hospital/presentation/settings/settings_screen.dart';

@RoutePage()
class LayoutScreen extends HookConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    const List<Widget> screen = [
      HomeScreen(),
      SettingsScreen(),
    ];
    LayoutController controller = ref.read(layoutControllerProvider.notifier);
    LayoutState state = ref.watch(layoutControllerProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: screen[state.pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Paramètre"),
        ],
        onTap: (value) {
          controller.changePageIndex(value);
        },
        currentIndex: state.pageIndex,
      ),
    );
  }
}
