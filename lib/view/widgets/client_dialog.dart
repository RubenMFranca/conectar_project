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
        child: Form(
          key: controller.formKeyCreateClients,
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller.razaoSocialCtrl,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(labelText: 'Razão social'),
                validator: (value) {
                  if (value != null) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.cnpjCtrl,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: [
                  cnpjMask,
                  LengthLimitingTextInputFormatter(18),
                ],
                decoration: const InputDecoration(labelText: 'CNPJ'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'CNPJ obrigatório';
                  if (value.length < 18) return 'CNPJ incompleto';
                  return null;
                },
              ),
              TextFormField(
                controller: controller.nomeFachadaCtrl,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(labelText: 'Nome na fachada'),
                validator: (value) {
                  if (value != null) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.tagCtrl,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(labelText: 'Tag'),
                validator: (value) {
                  if (value != null) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
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
            Obx(() {
              return ElevatedButton(
                onPressed: () async {
                  // if (controller.formKeyCreateClients.currentState!
                  //     .validate()) {
                  await controller.postClient(context);
                  // if (context.mounted) {
                  //   Navigator.of(context).pop();
                  // }
                  // }
                },
                child: controller.isLoading.value
                    ? CircularProgressIndicator(
                        color: theme.colorScheme.secondary,
                      )
                    : const Text('Salvar'),
              );
            }),
          ],
        ),
      ],
    );
  }
}
