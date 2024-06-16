# Flutter: Estudo de carga de API com apresentação em ListView.

Para rodar esse projeto você pode criar um mockapi em https://mockapi.io/ com o endpoint "friends" com a seguinte estrutura: 

| Atributo | Tipo | Função geradora |
| ------ | ------ | ------ |
| id |  Object ID | - |
| name | Faker.js | name.fullName |
| avatar |  Faker.js | image.avatar |
| user |  Faker.js | internet.userName |

Edite o arquivo "lib\services\friend_service.dart" colocando o url da api no atributo "api" (sem http://) e o endpoint no atributo "endpoint".

Por exemplo, se a url completa for "https://666d763623a3738f7cacc6e6a.mockapi.io/friends/" você deve preencher da seguinte forma: 

```dart
final String api = '666d763623a3738f7cacc6e6a.mockapi.io';
final String endpoint = 'friends';
```
