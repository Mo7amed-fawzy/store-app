import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({
    super.key,
  });

  static String id = 'update Product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  String? price;
  String? category;
  bool isLoading = false;
  // Controllers لتحديد القيم الافتراضية
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _imageController = TextEditingController();

  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductModel updateproduct =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    // تعيين القيم الافتراضية للنصوص في controllers
    _nameController.text = productName ?? updateproduct.title;
    _descController.text = desc ?? updateproduct.description;
    _priceController.text = price ?? updateproduct.price.toString();
    _imageController.text = image ?? updateproduct.image;
    _categoryController.text = category ?? updateproduct.category;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                CustomTextField(
                  hintText: 'Product Name',
                  controller: _nameController,
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _descController,
                  hintText: 'Description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _priceController,
                  hintText: 'Price',
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _imageController,
                  hintText: 'Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _categoryController,
                  hintText: 'category',
                  onChanged: (data) {
                    category = data;
                  },
                  isEditable: false,
                ),
                const SizedBox(height: 25),
                CustomButton(
                  buttontext: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(updateproduct);
                      if (mounted) {
                        setState(() {
                          // بعد التحديث، قم بتحديث القيم في واجهة المستخدم
                          productName = _nameController.text;
                          desc = _descController.text;
                          price = _priceController.text;
                          image = _imageController.text;
                          category = _categoryController.text;
                          showSnackBar(context, 'Success');
                        });
                        if (kDebugMode) {
                          print('نجاححSuccess');
                        }
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print(e.toString());
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().putProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}

// CustomButton(
//   buttontext: 'Update',
//   onTap: () async {
//     isLoading = true;
//     setState(() {});
//     try {
//       ProductModel updatedProduct = await updateProduct(updateproduct);

//       setState(() {
//         productName = _nameController.text;
//         desc = _descController.text;
//         price = _priceController.text;
//         image = _imageController.text;
//         category = _categoryController.text;
//       });

//       showSnackBar(context, 'Update Success');
      
//       Navigator.pop(context, updatedProduct); // إرجاع المنتج المحدث للصفحة السابقة
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }
//     isLoading = false;
//     setState(() {});
//   },
// )

// Future<ProductModel> updateProduct(ProductModel product) async {
//   ProductModel updatedProduct = await UpdateProductService().putProduct(
//     id: product.id,
//     title: productName == null ? product.title : productName!,
//     price: price == null ? product.price.toString() : price!,
//     description: desc == null ? product.description : desc!,
//     image: image == null ? product.image : image!,
//     category: product.category,
//   );
//   return updatedProduct; // إرجاع المنتج المحدث
// }

