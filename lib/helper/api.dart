import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    // عملت الريكويست بتاعي خدت الريسبونس  Future<http.Response> كانت

    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    } // عملت التعديل هنا
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    // بتشك من اول الديكود لحد الريتيرن
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      required dynamic body, // الاحسن Map<String,dynamic>
      String? token}) async {
    // @required يعني ممكن يتطلب وممكن لا
    Map<String, String> headers = {};

    if (token != null) {
      // لو التوكن != نل حط الهيدرز
      // او بمعني تاني لو المستخدم معندهوش صلاحيه متحطش الهيدرز
      // دي بديلو كيي وفاليوaddAll
      headers.addAll({
        'Authrization': 'Bearar $token',
        // 'Accept': 'application/json',
        // 'Content-Type': 'application/x-www-form-urlencoded' // باخد القبل ال;
        // bearer token يعني عندي صلاحيات علي اليوارال اني عندي صلاحيه اضيف
        // وبستقبلها لما اعمل ريجستر وبترجع حاجه اسمها كريدينشيالز فالفايرباز
        // جواها في حاجه اسمها توكن ودي بستعملها عشان اعبر ان عندي صلاحيه لاي حاجه علي فايرباز})
      });
    }
    http.Response response = await http.post(
      Uri.parse(url),
      // علشان البودي هي ماب فهعمل القوس دا
      body: body,
      // هحدد نوع البيانات البستقبلها والببعتها
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is problem with status code ${response.body} with body ${jsonDecode(response.body)}');
    }
  }

  // الفرق بين بوست وبوت الوبست غالبا بتكون فورم داتا والتانيه غالبا بتكون الانكوديد

  Future<dynamic> put(
      {required String url, required dynamic body, String? token}) async {
    Map<String, String> headers = {};

    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({
        'Authrization': 'Bearar $token',
      });
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is problem with status code ${response.body} with body ${jsonDecode(response.body)}');
    }
  }
}
