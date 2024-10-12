import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // دي البتخلي الصورة تطلع برا الستاك
      children: [
        Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 6), // بقولو اعرضي اول 5 حروف
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // الرو اخد المساحه المتاحه ليه فبتالي الاب بيسنتر حاجته فهعمل كروساكسسالايمنت
                    children: [
                      Text(
                        '\$ ${product.price}',
                        // '\$255',
                        // r'$255',
                        style: const TextStyle(fontSize: 13),
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
        Positioned(
          right: 32,
          top: -65,
          child: ClipOval(
            child: Image.network(
              product.image,
              // 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
              height: 100,
              width: 100, // الارتفاع والعرض متساويين علشان شكل الدايره
              fit: BoxFit.cover, // علشان تبقي خلفية
            ),
          ),
        )
      ],
    );
  }
}
