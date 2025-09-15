import 'package:conectar_project/models/user_model.dart';
import 'package:conectar_project/repositories/services/user_service.dart';

class UserRepository {
  final UserService _service = UserService();

  Future<UserModel> getUserById(int id) async {
    return await _service.getUserById(id);
  }
}
