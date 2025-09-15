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
