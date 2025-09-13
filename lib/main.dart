import 'package:conectar_project/controllers/login_controller.dart';
import 'package:conectar_project/routes/app_router.dart';
import 'package:conectar_project/utils/theme_conectar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(LoginController());
  runApp(const ConectarApp());
}

class ConectarApp extends StatelessWidget {
  const ConectarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Conectar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeConectar.lightTheme,
      routerConfig: appRouter,
    );
  }
}
