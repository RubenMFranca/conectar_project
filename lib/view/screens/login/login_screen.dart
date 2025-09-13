import 'package:conectar_project/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.delete<LoginController>();
    Get.lazyPut<LoginController>(() => LoginController());
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo-conectar.jpg',
                  width: 300,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: 500,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: loginController.formKeyLogin,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          controller: loginController.emailController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O email é obrigatório';
                            }
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!emailRegex.hasMatch(value.trim())) {
                              return 'Digite um email válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Senha',
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(height: 4),
                        Obx(
                          () => TextFormField(
                            controller: loginController.passwordController,
                            obscureText:
                                !loginController.isPasswordVisible.value,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              isDense: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.6,
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    loginController.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: theme.colorScheme.primary,
                                  ),
                                  onPressed: () {
                                    loginController.isPasswordVisible.value =
                                        !loginController
                                            .isPasswordVisible
                                            .value;
                                  },
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'A senha é obrigatória';
                              }
                              if (value.trim().length < 6) {
                                return 'A senha deve ter pelo menos 6 caracteres';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) =>
                                loginController.handleLogin(context),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Obx(() {
                          if (loginController.isLoading.value) {
                            return const CircularProgressIndicator();
                          }
                          return Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                          theme.colorScheme.primary,
                                        ),
                                  ),
                                  onPressed: () =>
                                      loginController.handleLogin(context),
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
