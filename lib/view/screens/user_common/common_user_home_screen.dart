import 'package:conectar_project/controllers/common_user_home_controller.dart';
import 'package:conectar_project/view/widgets/header_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonUserHomeScreen extends StatelessWidget {
  const CommonUserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.delete<CommonUserhomeController>();
    final clientHomeController = Get.put(CommonUserhomeController());
    return Scaffold(
      body: Column(
        children: [
          HeaderComponent(),
          Expanded(
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
                          Text(
                            'Meu perfil',
                            style: theme.textTheme.titleMedium,
                          ),
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
                              if (clientHomeController.isLoading.value) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Obx(() {
                                if (clientHomeController.isLoading.value ||
                                    clientHomeController.selectedClient.value ==
                                        null) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                final client =
                                    clientHomeController.selectedClient.value!;
                                final formattedDate = DateFormat('dd/MM/yyyy')
                                    .format(
                                      DateTime.parse(
                                        client.createdAt.toString(),
                                      ),
                                    );

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
                                        Text(client.name),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'E-mail: ',
                                          style: theme.textTheme.titleSmall,
                                        ),
                                        SizedBox(width: 4),
                                        Text(client.email),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Data de criação: ',
                                          style: theme.textTheme.titleSmall,
                                        ),
                                        SizedBox(width: 4),
                                        Text(formattedDate),
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
                                      borderRadius:
                                          BorderRadiusGeometry.circular(5),
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
          ),
        ],
      ),
    );
  }
}
