import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_platform/providers/products_provider.dart';

import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static String route = '/product-details-screen';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passedId = ModalRoute.of(context)!.settings.arguments as String;
    Product currentProduct =
        Provider.of<ProductsProvider>(context).findById(passedId);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentProduct.title),
      ),
    );
  }
}
