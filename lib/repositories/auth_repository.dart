import 'services/auth_service.dart';

class AuthRepository {
  final AuthService _service = AuthService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _service.login(email, password);
  }
}
