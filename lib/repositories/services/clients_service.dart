import 'package:conectar_project/core/services/api_client.dart';
import 'package:conectar_project/models/client_model.dart';
import 'package:dio/dio.dart';

class ClientsService {
  final ApiClient _apiClient = ApiClient();

  final Dio _dio = ApiClient().client;

  Future<List<ClientModel>> getClients({
    String? name,
    String? cnpj,
    String? status,
    String? razaoSocial,
  }) async {
    try {
      final response = await _dio.get(
        '/clients',
        queryParameters: {
          if (name != null && name.isNotEmpty) 'nomeFachada': name,
          if (cnpj != null && cnpj.isNotEmpty) 'cnpj': cnpj,
          if (status != null && status.isNotEmpty) 'status': status,
          if (razaoSocial != null && razaoSocial.isNotEmpty)
            'razaoSocial': razaoSocial,
        },
      );

      final List data = response.data as List;
      return data.map((e) => ClientModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar clientes: $e');
    }
  }

  Future<void> createClient(ClientModel client) async {
    await _apiClient.client.post('/clients', data: client.toJson());
  }

  Future<void> updateClient(ClientModel client) async {
    await _apiClient.client.put('/clients/${client.id}', data: client.toJson());
  }
}
