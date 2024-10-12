import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

Widget? checkSnapshotState(AsyncSnapshot<List<ProductModel>> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError) {
    return Center(child: Text('An error occurred: ${snapshot.error}'));
  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return const Center(child: Text('No products available'));
  }
  return null;
}
