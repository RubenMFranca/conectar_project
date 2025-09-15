import 'package:conectar_project/models/login_model.dart';
import 'package:conectar_project/repositories/auth_repository.dart';
import 'package:conectar_project/view/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginController extends GetxController {
  final storage = const FlutterSecureStorage();
  final AuthRepository _authRepository = AuthRepository();
  LoginModel? loginModel;
  final formKeyLogin = GlobalKey<FormState>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordVisible = false.obs;
  var userRole = ''.obs;

  void handleLogin(BuildContext context) async {
    if (formKeyLogin.currentState!.validate()) {
      await login(context);
    }
  }

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _authRepository.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      loginModel = LoginModel.fromJson(response);

      if (loginModel?.accessToken == null) {
        errorMessage.value = 'Token de acesso não encontrado.';
        return;
      }
      await storage.write(key: 'token', value: loginModel!.accessToken);

      final role = loginModel?.user.role;
      if (role == null) {
        errorMessage.value = 'Role do usuário não encontrada.';
        return;
      }
      await storage.write(key: 'role', value: role);

      userRole.value = loginModel!.user.role ?? '';

      await storage.write(key: 'token', value: loginModel!.accessToken);

      final userId = loginModel?.user.id;
      if (userId != null) {
        await storage.write(key: 'userId', value: userId.toString());
      }

      if (!context.mounted) return;

      if (userRole.value == 'admin' || userRole.value == 'Admin') {
        context.go('/home/admin');
      } else {
        context.go('/home/client');
      }
    } catch (e) {
      errorMessage.value =
          'Não foi possível fazer login. Verifique suas credenciais.';
      CustomDialog.error(
        context: context,
        message: 'Não foi possível fazer login. Verifique suas credenciais.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await storage.read(key: "token");
    return token != null;
  }

  Future<void> logout(BuildContext context) async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'role');

    context.go('/login');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
