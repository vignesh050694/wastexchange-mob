import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/login_response.dart';

class ApiProvider {
  Client _client;

  ApiProvider([Client client]) {
    this._client = client == null ? Client() : client;
  }

  Future<LoginResponse> login(String loginId, String password) async {
    var map = new Map<String, String>();
    map['loginId'] = loginId;
    map['password'] = password;
    final response = await _client
        .post('http://data.indiawasteexchange.com/users/login', body: map);
    if (response.statusCode != 200) {
      throw Exception('failed to login');
    }
    return LoginResponse.fromJson(json.decode(response.body));
  }
}