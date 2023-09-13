import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/data/pb_client.dart';
import 'package:hospital/presentation/check_auth/controller/controller.dart';
import 'package:hospital/presentation/layout/layout_screen.dart';
import 'package:hospital/presentation/login/login_screen.dart';

@RoutePage()
class CheckAuthScreen extends HookConsumerWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var checkAuth = ref.watch(checkAuthProvider);
    var pb = ref.watch(pbClientProvider);
    return checkAuth.when(
      data: (data) {
        if (pb.authStore.isValid) {
          return const LayoutScreen();
        }
        return const LoginScreen();
      },
      error: (error, stackTrace) {
        return const Scaffold(
            body: Center(
          child: Text("Error"),
        ));
      },
      loading: () {
        // if (pb.authStore.isValid) {
        //   return const LayoutScreen();
        // }
        return const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
