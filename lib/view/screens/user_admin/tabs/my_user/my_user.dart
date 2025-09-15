import 'package:conectar_project/controllers/admin_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyUser extends StatelessWidget {
  const MyUser({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminHomeController = Get.put(AdminHomeController());
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: theme.colorScheme.onSurface),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Text('Meu perfil', style: theme.textTheme.titleMedium),
                    Text(
                      'Dados cadastrados',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey.withValues(alpha: 0.7),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(() {
                        if (adminHomeController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Obx(() {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Nome: ',
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(width: 4),
                                  Text(adminHomeController.myUser.value!.name),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'E-mail: ',
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(width: 4),
                                  Text(adminHomeController.myUser.value!.email),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Papel do usuário: ',
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    adminHomeController.myUser.value!.role ==
                                            'admin'
                                        ? 'Administrador'
                                        : 'Usuário Regular',
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              theme.colorScheme.primary,
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // clientHomeController.fetchClientById(2);
                          },
                          child: Text('Editar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
