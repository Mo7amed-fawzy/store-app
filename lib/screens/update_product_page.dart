import 'package:flutter/material.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  UpdateProductPage(
      {super.key,
      this.desc,
      this.image,
      this.price,
      this.productName,
      this.category});

  static String id = 'update Product';
  String? productName, desc, image, category;
  int? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent, // هيظهر اللون التحتها علطول
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTextField(
                hintText: 'Product Name',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Description',
                onChanged: (data) {
                  productName = data;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Price',
                inputType: TextInputType.number,
                onChanged: (data) {
                  desc = int.parse(data) as String?;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Image',
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'category',
                onChanged: (data) {
                  category = data;
                },
                isEditable: false,
              ),
              const SizedBox(height: 25),
              const CustomButton(buttontext: 'Update')
            ],
          ),
        ),
      ),
    );
  }
}
