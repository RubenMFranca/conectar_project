# 📱 Conéctar App (Frontend)

Frontend do projeto **Conéctar**, desenvolvido em **Flutter**.  
Este projeto é responsável pela interface do usuário (clientes e administradores), integrando-se com a **API Conéctar** para autenticação, listagem e gerenciamento de dados.

---

## Tecnologias Utilizadas

- [Flutter](https://flutter.dev/) (>= 3.x.x)
- [Dart](https://dart.dev/)
- [GetX](https://pub.dev/packages/get) para gerenciamento de estado
- [GoRouter](https://pub.dev/packages/go_router) para navegação
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage) para armazenamento seguro de tokens
- [Dio](https://pub.dev/packages/dio) para requisições HTTP

---

# Documentação de Arquitetura – Conéctar App

## Organização de Pastas

lib/

     ├── controllers/ # Lógica de estado e UI (GetX)

     ├── core/ # Serviços genéricos (ex: ApiClient)

     ├── models/ # Modelos de dados (UserModel, ClientModel)

     ├── repositories/ # Comunicação entre Controller e Service

     ├── ui/ # Telas e componentes visuais

     ├── utils/ # Utilitários e helpers

Escolha adotada: separar controllers, repositories e services mantém a arquitetura limpa, seguindo padrões semelhantes a MVC e Clean Architecture.
O core contém apenas serviços genéricos reutilizáveis (ex.: ApiClient) para evitar duplicação.

## Serviços e Repositórios

● ApiClient: centraliza chamadas HTTP, adicionando token JWT automaticamente.
● Repositórios: camada intermediária entre Controller e Service.
● Services: realizam chamadas HTTP reais.

Benefício: separação de lógica de negócios da API, facilitando testes e
mudançasmudanças na API sem impactar a UI.

## Login e Autenticação

Fluxo: LoginController → AuthRepository → AuthService → LoginModel →
token salvo no FlutterSecureStorage → navegação via GoRouter baseada em role.
Escolha adotada: token e dados do usuário acessíveis globalmente; redirecionamento
seguro por role.

## UI e Componentização

● Componentes reutilizáveis: HeaderComponent, ClientDialog.
● DataTable responsiva: SingleChildScrollView + Scrollbar.
● Formulários: TextFormField + TextEditingController, máscaras, validações
condicionais, switches.

Benefício: reutilização, consistência visual e experiência do usuário aprimorada.

## Escolhas Gerais

● Segurança: token JWT seguro no FlutterSecureStorage.
● Escalabilidade: fácil adição de novas telas e funcionalidades.
● Reatividade: GetX .obs atualiza UI automaticamente.
● Navegação: GoRouter declarativo, context.go() e redirect para fluxo seguro.
● Estado: GetX, Controllers por tela, variáveis reativas.

## Pré-requisitos

Antes de rodar o projeto, você precisa ter instalado:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (já incluso no Flutter)
- Um **emulador** ou **dispositivo físico** para rodar o app
- [Git](https://git-scm.com/) para clonar o repositório

> ⚠️ Certifique-se de configurar corretamente o ambiente Flutter.  
> Execute `flutter doctor` no terminal e verifique se todas as dependências estão OK.

---

## Instalação e Configuração

Clone este repositório no seu ambiente local:

``bash`
git clone <URL_DO_SEU_REPOSITORIO>
cd <NOME_DO_PROJETO>

Instale as dependências do Flutter:

``bash`
flutter pub get

Para rodar o projeto em modo de desenvolvimento, use:

``bash`
flutter run -d web-server --web-port 8080

Obs:
Após a execução do comando, o Flutter iniciará um servidor local e exibirá no terminal algo como:
Web Server listening on http://localhost:8080

Agora basta abrir o navegador de sua preferência e acessar:

     http://localhost:8080

Para rodar em um dispositivo ou emulador específico:

``bash`
flutter devices
flutter run -d <ID_DO_DISPOSITIVO>

## Usuários de Teste

Para facilitar os testes da aplicação, os seguintes usuários já estão cadastrados no banco de dados:

| Nome                     | Email           | Senha     | Papel       |
| ------------------------ | --------------- | --------- | ----------- |
| Admin Conectar           | admin@email.com | senha1234 | admin       |
| Usuário Regular Conectar | user@email.com  | senha1234 | userRegular |

> 💡 Observação: Essas contas podem ser usadas diretamente para login na aplicação. Caso o banco seja reiniciado, certifique-se de recriar esses usuários.
