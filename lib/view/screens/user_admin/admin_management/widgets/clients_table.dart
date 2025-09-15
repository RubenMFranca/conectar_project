import 'package:conectar_project/controllers/admin_home_controller.dart';
import 'package:conectar_project/view/widgets/client_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ClientsTable extends StatelessWidget {
  final AdminHomeController controller;

  const ClientsTable({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Clientes', style: theme.textTheme.titleSmall),
          Text(
            'Selecione um usuário para editar suas informações',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          _buildNewClientButton(context, theme),
          const SizedBox(height: 16),
          _buildDataTable(theme, context),
        ],
      ),
    );
  }

  Widget _buildNewClientButton(BuildContext context, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              theme.colorScheme.secondary,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              useRootNavigator: true,
              builder: (context) => ClientDialog(controller: controller),
            );
          },
          child: const Text(
            'Novo',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable(ThemeData theme, BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.clients.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Icon(Icons.store_outlined, size: 50, color: Colors.grey),
                const SizedBox(height: 12),
                Text(
                  'Nenhum cliente cadastrado.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      }

      return Scrollbar(
        thumbVisibility: true,
        interactive: true,
        thickness: 8,
        radius: const Radius.circular(4),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataTable(
                showCheckboxColumn: false,
                dividerThickness: 0.2,
                headingRowColor: WidgetStatePropertyAll(
                  theme.colorScheme.primary.withValues(alpha: 0.1),
                ),
                headingRowHeight: 50,
                dataRowHeight: 48,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Razão social',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'CNPJ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Nome na fachada',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Tags',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Conecta Plus',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: controller.clients.map((client) {
                  return DataRow(
                    onSelectChanged: (selected) {
                      if (selected ?? false) {
                        context.go('/clients/edit/${client.id}');
                      }
                    },
                    cells: [
                      DataCell(Text(client.razaoSocial)),
                      DataCell(Text(client.cnpj)),
                      DataCell(Text(client.nomeFachada)),
                      DataCell(Text(client.tag)),
                      DataCell(Text(client.status)),
                      DataCell(Text(client.conectaPlus ? 'Sim' : 'Não')),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
