import 'package:conectar_project/models/client_model.dart';
import 'package:conectar_project/models/user_model.dart';
import 'package:conectar_project/repositories/client_repository.dart';
import 'package:conectar_project/repositories/services/clients_service.dart';
import 'package:conectar_project/repositories/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final storage = const FlutterSecureStorage();
  late TabController tabController;
  final ClientRepository _repository = ClientRepository();
  final ClientsService _serviceClient = ClientsService();
  final UserService _serviceUser = UserService();
  final formKeySearchClients = GlobalKey<FormState>();
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
  var myUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 1, vsync: this);
    loadAndFetchUser();
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

  void resetClientFields() {
    razaoSocialCtrl.clear();
    cnpjCtrl.clear();
    nomeFachadaCtrl.clear();
    tagCtrl.clear();
    statusAtivo.value = false;
    possuiConectaPlus.value = false;
  }

  void toggleExpandido() {
    if (expandido.value) {
      limparCampos();
      expandido.value = false;
    } else {
      expandido.value = true;
    }
  }

  void limparCampos() {
    searchNomeCtrl.clear();
    searchCnpjCtrl.clear();
    searchStatusCtrl.clear();
    searchRazaoSocialCtrl.clear();
    fetchClients();
  }

  // Future<void> loadAndFetchUser() async {
  //   isLoading.value = true;
  //   try {
  //     final userIdString = await storage.read(key: 'userId');

  //     if (userIdString == null) {
  //       return;
  //     }

  //     final userId = int.tryParse(userIdString);
  //     if (userId == null) {
  //       return;
  //     }

  //     final client = await _serviceUser.getUserById(userId);
  //     myUser.value = UserModel.fromJson(client.toJson());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> loadAndFetchUser() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 1000));

      final userIdString = await storage.read(key: 'userId');
      if (userIdString == null) return;

      final userId = int.tryParse(userIdString);
      if (userId == null) return;

      final client = await _serviceUser.getUserById(userId);
      myUser.value = UserModel.fromJson(client.toJson());
    } finally {
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading.value = false;
    }
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

      fetchClients();
      limparCampos();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchClients() async {
    isLoading.value = true;
    try {
      final data = await _serviceClient.getClients(
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
