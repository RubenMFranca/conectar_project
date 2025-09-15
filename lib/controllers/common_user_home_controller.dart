import 'package:conectar_project/models/user_model.dart';
import 'package:conectar_project/repositories/services/user_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class CommonUserhomeController extends GetxController {
  final storage = const FlutterSecureStorage();
  final UserService _service = UserService();
  var selectedClient = Rxn<UserModel>();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAndFetchUser();
  }

  Future<void> loadAndFetchUser() async {
    isLoading.value = true;
    try {
      final userIdString = await storage.read(key: 'userId');

      if (userIdString == null) {
        return;
      }

      final userId = int.tryParse(userIdString);
      if (userId == null) {
        return;
      }

      final client = await _service.getUserById(userId);
      selectedClient.value = UserModel.fromJson(client.toJson());
    } finally {
      isLoading.value = false;
    }
  }
}
