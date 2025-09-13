class ClientModel {
  final int? id;
  final String nomeFachada;
  final String cnpj;
  final String razaoSocial;
  final ClientAdressModel? clientAdressModel;
  final String tag;
  final bool conectaPlus;
  final String status;

  ClientModel({
    this.id,
    required this.nomeFachada,
    required this.cnpj,
    required this.razaoSocial,
    this.clientAdressModel,
    required this.tag,
    required this.conectaPlus,
    required this.status,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      nomeFachada: json['nomeFachada'] ?? '',
      cnpj: json['cnpj'] ?? '',
      razaoSocial: json['razaoSocial'] ?? '',
      clientAdressModel: json['clientAdressModel'] != null
          ? ClientAdressModel.fromJson(json['clientAdressModel'])
          : null,
      status: json['status'] ?? 'Ativo',
      tag: json['tag'],
      conectaPlus: json['conecta_plus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nomeFachada': nomeFachada,
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
      if (clientAdressModel != null)
        'clientAdressModel': clientAdressModel!.toJson(),
      'status': status,
      'tag': tag,
      'conecta_plus': conectaPlus,
    };
  }
}

class ClientAdressModel {
  final String? cep;
  final String? rua;
  final String? bairro;
  final String? cidade;
  final String? estado;

  ClientAdressModel({
    this.cep,
    this.rua,
    this.bairro,
    this.cidade,
    this.estado,
  });

  factory ClientAdressModel.fromJson(Map<String, dynamic> json) {
    return ClientAdressModel(
      cep: json['cep'] ?? '',
      rua: json['rua'] ?? '',
      bairro: json['bairro'] ?? '',
      cidade: json['cidade'] ?? '',
      estado: json['estado'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'rua': rua,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    };
  }
}
