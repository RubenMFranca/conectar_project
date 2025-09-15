import 'package:conectar_project/view/screens/user_admin/tabs/admin_management/admin_management.dart';
import 'package:conectar_project/view/screens/user_admin/tabs/inside_information/inside_information.dart';
import 'package:conectar_project/view/screens/user_admin/tabs/my_user/my_user.dart';
import 'package:conectar_project/view/widgets/header_component.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderComponent(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TabBar(
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      overlayColor: WidgetStateProperty.resolveWith<Color?>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.hovered)) {
                          return theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          );
                        }
                        return Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1);
                      }),
                      tabs: [
                        Tab(text: 'Dados Básicos'),
                        Tab(text: 'Informações Internas'),
                        Tab(text: 'Usuário'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [AdminManagement(), InsideInformation(), MyUser()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
