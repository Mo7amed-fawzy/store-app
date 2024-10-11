import 'dart:convert';

import 'package:flutter/material.dart';
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

  Future<dynamic> post(
      {required String url, @required dynamic body, String? token}) async {
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
    if (response == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is problem with status code ${response.body} with body ${jsonDecode(response.body)}');
    }
  }
}
