import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // دي يعني الارتفاع والمقصد اختلافها عن الحوليها فاللون
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          title: const Text(
            'New Trend',
          ),
          centerTitle: true,
          // actions: const [Icon(Icons.shopping_cart)],
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
          child: GridView.builder(
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2, // كل متزود الhight يقل
                crossAxisSpacing: 10, // دا محوي x
                mainAxisSpacing: 100, // دا بتحكم فمحور y الهو الاساسي
              ), // بستخدمها فالتحكم فالمنظر
              itemBuilder: (context, index) {
                return const CustomCard();
              }),
        ));
  }
}
