import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProducts() // علشان مبياخدش حاجه فبتتحط كدا
  async {
    String baseUrl = 'https://fakestoreapi.com/products';

    List<dynamic> data = await Api().get(url: baseUrl);

    // List<dynamic> or Map<String, dynamic>
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
// كود شغال لما تكون التوكن موجوده فقط
// import 'dart:convert'; // تأكد من استيراد المكتبة لتحليل JSON
// import 'package:http/http.dart' as http;

// class GetAllProductService {
//   Future<List<ProductModel>> getAllProducts() async {
//     final response = await http.get(Uri.parse(
//         'https://fakestoreapi.com/products')); // استبدل YOUR_API_URL بعنوان الـ API الخاص بك

//     // تحليل JSON
//     List<dynamic> productsList = json.decode(response.body);
//     // تحويل كل عنصر إلى ProductModel
//     return productsList.map((json) => ProductModel.fromJson(json)).toList();
//   }
// }
