import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Container(
        height: 130,
        width: 220,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 0, // بيقولك هيتحرك مسافه قد اي او مدى تشويش الظل
              offset: const Offset(10, 10) // مقدار التحرك x,y
              )
        ] // بستخدمه علشان اتحكم فالشادو بتاع الكارد
            ),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'HandBag LV',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // الرو اخد المساحه المتاحه ليه فبتالي الاب بيسنتر حاجته فهعمل كروساكسسالايمنت
                  children: [
                    const Text(
                      '\$255',
                      // r'$255',
                      style: TextStyle(fontSize: 13),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.heart)),
                    // Icon(Icons.favorite)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
