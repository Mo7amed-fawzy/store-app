import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Add your action here
          http.Response response =
              await http.post(Uri.parse('https://fakestoreapi.com/products'),
                  // علشان البودي هي ماب فهعمل القوس دا
                  body: {
                'title': 'test product',
                'price': '13.5',
                'description': 'lorem ipsum set',
                'image': 'https://i.pravatar.cc',
                'category': 'electronic',
              },
                  // هحدد نوع البيانات البستقبلها والببعتها
                  headers: {
                'Accept': 'application/json',
                'Content-Type':
                    'application/x-www-form-urlencoded' // باخد القبل ال;
              }); // bearer token يعني عندي صلاحيات علي اليوارال اني عندي صلاحيه اضيف
          // وبستقبلها لما اعمل ريجستر وبترجع حاجه اسمها كريدينشيالز فالفايرباز
          // جواها في حاجه اسمها توكن ودي بستعملها عشان اعبر ان عندي صلاحيه لاي حاجه علي فايرباز
          if (kDebugMode) {
            print(response.body);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
