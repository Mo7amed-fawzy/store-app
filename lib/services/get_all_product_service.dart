import 'dart:convert';

import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProductService {
  Future<List<ProductModel>> getAllProducts() // علشان مبياخدش حاجه فبتتحط كدا
  async {
    String baseUrl = 'https://fakestoreapi.com';
    // عملت الريكويست بتاعي خدت الريسبونس
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));

    // بتشك من اول الديكود لحد الريتيرن
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      // List<dynamic> orMap<String, dynamic>
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(
          ProductModel.fromJson(data[i]),
          // كل مره بجيب الفاليو الجوا الليست واعملها ديكود يعني احولها للموديل بتاعي وبعد كدا اخزنه جوا ال productsList.add
        );
      }

      return productsList;
    } else {
      throw Exception(
          'there is problem with status code ${response.statusCode}');
    }
  }
}
