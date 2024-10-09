import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCateogiresProducts(
      {required String categoryName}) async {
    // دا مينفعش علشان دا مثال :category_name فهبعت هنا المهتم اني اجيبو
    String baseUrl = 'https://fakestoreapi.com/products/category';
    List<dynamic> data = await Api().get(url: '$baseUrl/$categoryName');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }

    return productsList;
  }
}
