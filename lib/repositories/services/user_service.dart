import 'package:conectar_project/core/services/api_client.dart';
import 'package:conectar_project/models/user_model.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  Future<UserModel> getClientById(int id) async {
    final response = await _apiClient.client.get('/users/$id');
    return UserModel.fromJson(response.data);
  }
}
