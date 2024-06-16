import 'package:flutter_scroll_api_test/entity/friend.dart';

import "dart:convert";
import 'package:http/http.dart' as http;

class FriendService {
  final String api = '666d76367a3738f7cacc6e6a.mockapi.io';
  final String endpoint = 'friends/';
  final limit = 10;

  Future<List<Friend>> findAll(int page) async {
    List<Friend> list = [];
    var uri = Uri.https(
      api,
      endpoint,
      {
        'page': page.toString(),
        'limit': limit.toString(),
      },
    );
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> listResponse = json.decode(response.body);
      for (var item in listResponse) {
        list.add(Friend.fromJson(item));
      }
    }

    return list;
  }
}
