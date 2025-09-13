import 'package:conectar_project/controllers/login_controller.dart';
import 'package:conectar_project/view/screens/login/login_screen.dart';
import 'package:conectar_project/view/screens/user_admin/admin_home_screen.dart';
import 'package:conectar_project/view/screens/user_common/common_user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',

  redirect: (BuildContext context, GoRouterState state) async {
    final loginController = Get.find<LoginController>();

    final bool isLoggedIn = await loginController.isLoggedIn();

    final String location = state.matchedLocation;
    final bool isGoingToLogin = location == '/login';

    if (!isLoggedIn && !isGoingToLogin) {
      return '/login';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginApp(),
    ),

    GoRoute(
      path: '/home/admin',
      name: 'home_admin',
      builder: (context, state) => const AdminHomeScreen(),
    ),
    GoRoute(
      path: '/home/client',
      name: 'home_client',
      builder: (context, state) => const CommonUserHomeScreen(),
    ),
  ],
);
