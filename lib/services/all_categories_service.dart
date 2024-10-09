import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  // علشان دي مباشرة فهتعامل معاها  علطل منغير مودل
  Future<List<dynamic>> getAllCateogires() async {
    String baseUrl = 'https://fakestoreapi.com/products/categories';
    List<dynamic> data = await Api().get(url: baseUrl);

    return data;
  }
}
