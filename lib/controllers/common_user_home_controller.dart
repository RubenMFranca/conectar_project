import 'package:conectar_project/models/user_model.dart';
import 'package:conectar_project/repositories/services/user_service.dart';
import 'package:get/get.dart';

class CommonUserhomeController extends GetxController {
  final UserService _service = UserService();

  var selectedClient = Rxn<UserModel>();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchClientById(1);
  }

  Future<void> fetchClientById(int id) async {
    isLoading.value = true;
    try {
      final client = await _service.getClientById(id);
      selectedClient.value = UserModel.fromJson(client.toJson());
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao buscar cliente: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
