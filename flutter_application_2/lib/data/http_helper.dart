import 'user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpHelper {
  final String domain = 'randomuser.me';
  final String path = 'api/';

  Future<List<User>> fetchUsers(int usercount) async {
    Map<String, dynamic> params = {'results': usercount.toString()};
    Uri uri = Uri.https(domain, path, params);
    http.Response response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> userList = data['results'];
    List<User> users = userList.map((json) => User.fromJson(json)).toList();
    return users;
  }

  //add other functions to handle other endpoints
}
