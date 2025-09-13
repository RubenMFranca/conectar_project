import 'package:conectar_project/core/services/api_client.dart';
import 'package:dio/dio.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _apiClient.client.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Erro ao autenticar usuário',
      );
    }
  }
}
