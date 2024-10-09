import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    // عملت الريكويست بتاعي خدت الريسبونس  Future<http.Response> كانت
    http.Response response = await http.get(Uri.parse(url));

    // بتشك من اول الديكود لحد الريتيرن
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is problem with status code ${response.statusCode}');
    }
  }
}
