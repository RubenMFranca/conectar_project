import 'package:conectar_project/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final LoginController loginController = Get.put(LoginController());
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(color: theme.colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/logo-conectar.jpg',
              width: 100,
              fit: BoxFit.fill,
            ),
            Row(
              spacing: 8,
              children: [
                Tooltip(
                  message: 'Você está em um ambiente de\n teste da Conéctar',
                  child: Icon(
                    Icons.help_outline_rounded,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                Tooltip(
                  message: 'Sem noticações',
                  child: Icon(
                    Icons.notifications,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  color: theme.colorScheme.secondary,
                  tooltip: 'Sair',
                  onPressed: () {
                    loginController.logout(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
