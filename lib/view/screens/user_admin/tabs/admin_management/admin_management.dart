import 'package:conectar_project/controllers/admin_home_controller.dart';
import 'package:conectar_project/view/screens/user_admin/tabs/admin_management/widgets/clients_filter.dart';
import 'package:conectar_project/view/screens/user_admin/tabs/admin_management/widgets/clients_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminManagement extends StatelessWidget {
  const AdminManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.delete<AdminHomeController>();
    final adminHomeController = Get.put(AdminHomeController());

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: theme.colorScheme.onSurface),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClientsFilter(controller: adminHomeController),
            const SizedBox(height: 24),
            ClientsTable(controller: adminHomeController),
          ],
        ),
      ),
    );
  }
}
