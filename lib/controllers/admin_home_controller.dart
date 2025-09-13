import 'package:conectar_project/models/client_model.dart';
import 'package:conectar_project/repositories/client_repository.dart';
import 'package:conectar_project/repositories/services/clients_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final ClientRepository _repository = ClientRepository();
  final ClientsService _service = ClientsService();
  var isLoading = false.obs;
  var expandido = false.obs;
  var clients = <ClientModel>[].obs;
  final searchNomeCtrl = TextEditingController();
  final searchCnpjCtrl = TextEditingController();
  final searchStatusCtrl = TextEditingController();
  final searchRazaoSocialCtrl = TextEditingController();
  final razaoSocialCtrl = TextEditingController();
  final cnpjCtrl = TextEditingController();
  final nomeFachadaCtrl = TextEditingController();
  final tagCtrl = TextEditingController();
  var statusAtivo = false.obs;
  var possuiConectaPlus = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 1, vsync: this);
    fetchClients();
  }

  @override
  void onClose() {
    tabController.dispose();
    searchNomeCtrl.dispose();
    searchCnpjCtrl.dispose();
    searchStatusCtrl.dispose();
    searchRazaoSocialCtrl.dispose();
    expandido.value = false;
    super.onClose();
  }

  void toggleExpandido() {
    expandido.value = !expandido.value;
  }

  void limparCampos() {
    searchNomeCtrl.clear();
    searchCnpjCtrl.clear();
    searchStatusCtrl.clear();
    searchRazaoSocialCtrl.clear();
    fetchClients();
  }

  Future<void> postClient() async {
    isLoading.value = true;
    try {
      final client = ClientModel(
        razaoSocial: razaoSocialCtrl.text.trim(),
        cnpj: cnpjCtrl.text.trim(),
        nomeFachada: nomeFachadaCtrl.text.trim(),
        tag: tagCtrl.text.trim(),
        status: statusAtivo.value ? "ativo" : "inativo",
        conectaPlus: possuiConectaPlus.value,
      );

      await _repository.createClient(client);

      Get.snackbar('Sucesso', 'Cliente criado com sucesso!');
      fetchClients();
      limparCampos();
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao criar cliente: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchClients() async {
    isLoading.value = true;
    try {
      final data = await _service.getClients(
        name: searchNomeCtrl.text,
        cnpj: searchCnpjCtrl.text,
        status: searchStatusCtrl.text,
        razaoSocial: searchRazaoSocialCtrl.text,
      );

      clients.value = data;
    } catch (e) {
      Get.snackbar('Erro', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
