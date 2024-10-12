import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/helper/error_function.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        title: const Text('New Trend'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartPlus),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductService().getAllProducts(),
          builder: (context, snapshot) {
            if (kDebugMode) {
              print('السنااابششوووت بتاعي $snapshot');
            }
            if (checkSnapshotState(snapshot) == null) {
              List<ProductModel> productsListSnapshot = snapshot.data!;
              return GridView.builder(
                itemCount: productsListSnapshot.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    product: productsListSnapshot[index],
                  );
                },
              );
            } else {
              return checkSnapshotState(snapshot)!;
            }
          },
        ),
      ),
    );
  }
}
