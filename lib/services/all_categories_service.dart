import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategoriesService {
  // علشان دي مباشرة فهتعامل معاها  علطل منغير مودل
  Future<List<dynamic>> getAllCateogires() async {
    String baseUrl = 'https://fakestoreapi.com/products/categories';
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is problem with status code ${response.statusCode}');
    }
  }
}
