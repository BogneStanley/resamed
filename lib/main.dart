import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/res/themes.dart';
import 'package:hospital/router/app_route.dart';

ImageProvider imageProv = AssetImage("assets/img/reservation.jpg");

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(imageProv, context);
    return MaterialApp.router(
      title: "Hospital App",
      routerConfig: _appRouter.config(),
      theme: AppThemes.defaultTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
