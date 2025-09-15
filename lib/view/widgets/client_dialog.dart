import 'package:conectar_project/controllers/admin_home_controller.dart';
import 'package:conectar_project/utils/mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ClientDialog extends StatelessWidget {
  const ClientDialog({super.key, required this.controller});

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: theme.colorScheme.secondary,
      title: Text(
        'Cadastro de cliente',
        textAlign: TextAlign.center,
        style: theme.textTheme.titleMedium,
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller.razaoSocialCtrl,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(labelText: 'Razão social'),
            ),
            TextFormField(
              controller: controller.cnpjCtrl,
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              inputFormatters: [cnpjMask, LengthLimitingTextInputFormatter(18)],
              decoration: const InputDecoration(labelText: 'CNPJ'),
            ),
            TextFormField(
              controller: controller.nomeFachadaCtrl,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(labelText: 'Nome na fachada'),
            ),
            TextFormField(
              controller: controller.tagCtrl,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(labelText: 'Tag'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Status'),
                Obx(
                  () => Switch(
                    value: controller.statusAtivo.value,
                    onChanged: (val) => controller.statusAtivo.value = val,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Possui Conecta Plus?'),
                Obx(
                  () => Switch(
                    value: controller.possuiConectaPlus.value,
                    onChanged: (val) =>
                        controller.possuiConectaPlus.value = val,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.resetClientFields();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.postClient();
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ],
    );
  }
}
