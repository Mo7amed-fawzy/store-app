import 'package:flutter/foundation.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> putProduct({
    // هحط هنا البيانات البودي واحطط الريكوايرد منها
    required String title,
    required String price,
    required String description,
    required String image,
    required int id,
    required String category,
  }) async {
    if (kDebugMode) {
      print('product id  داااا= $id');
    }

    Map<String, dynamic> productdata = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
    );
    return ProductModel.fromJson(productdata);
  }
}
