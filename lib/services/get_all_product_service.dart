import 'dart:convert';

import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetAllProductService {
  Future<List<ProductModel>> getAllProducts() // علشان مبياخدش حاجه فبتتحط كدا
  async {
    String baseUrl = 'https://fakestoreapi.com';
    // عملت الريكويست بتاعي خدت الريسبونس
    http.Response response = await http.get(Uri.parse('$baseUrl/products'));

    Map<String, dynamic> data = jsonDecode(response.body);

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
        // كل مره بجيب الفاليو الجوا الليست واعملها ديكود يعني احولها للموديل بتاعي وبعد كدا اخزنه جوا ال productsList.add
      );
    }

    return productsList;
  }
}
