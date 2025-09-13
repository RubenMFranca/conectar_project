import 'package:conectar_project/controllers/admin_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsFilter extends StatelessWidget {
  final AdminHomeController controller;

  const ClientsFilter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Obx(() {
        return InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: controller.toggleExpandido,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: controller.expandido.value
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: _buildHeader(theme),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(theme),
                  const SizedBox(height: 16),
                  _buildFilterFields(theme),
                  const SizedBox(height: 16),
                  _buildActions(theme),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Icon(Icons.search, size: 24, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Filtros", style: theme.textTheme.titleSmall),
                Text(
                  "Filtre e busque itens na página",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            turns: controller.expandido.value ? 0.5 : 0.0,
            child: Icon(
              Icons.keyboard_arrow_down,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterFields(ThemeData theme) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children: [
        _campoFiltro("Buscar por nome", theme, controller.searchNomeCtrl),
        _campoFiltro("Buscar por CNPJ", theme, controller.searchCnpjCtrl),
        _campoFiltro("Buscar por status", theme, controller.searchStatusCtrl),
        _campoFiltro(
          "Buscar por razão social",
          theme,
          controller.searchRazaoSocialCtrl,
        ),
      ],
    );
  }

  Widget _campoFiltro(
    String label,
    ThemeData theme,
    TextEditingController textController,
  ) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          TextFormField(
            controller: textController,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 120,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: theme.colorScheme.primary, width: 1),
              ),
            ),
            onPressed: controller.limparCampos,
            child: const Text('Limpar campos', style: TextStyle(fontSize: 12)),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 120,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: controller.fetchClients,
            child: const Text('Filtrar', style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}
