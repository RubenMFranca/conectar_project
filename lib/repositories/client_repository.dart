import 'package:conectar_project/models/client_model.dart';

import 'services/clients_service.dart';

class ClientRepository {
  final ClientsService _service = ClientsService();

  Future<List<ClientModel>> getClients({
    String? name,
    String? cnpj,
    String? status,
    String? razaoSocial,
  }) async {
    return await _service.getClients(
      name: name,
      cnpj: cnpj,
      status: status,
      razaoSocial: razaoSocial,
    );
  }

  Future<void> createClient(ClientModel client) async {
    await _service.createClient(client);
  }

  Future<void> updateClient(ClientModel client) async {
    await _service.updateClient(client);
  }
}
