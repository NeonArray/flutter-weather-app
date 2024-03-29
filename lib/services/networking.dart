import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    var response = await http.get(url);

    if (response.statusCode != 200) {
      return '';
    }

    return jsonDecode(response.body);
  }
}
