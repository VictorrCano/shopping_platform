import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../models/product.dart';

class FavoritesScreen extends StatelessWidget {
  static String route = '/favorites-screen';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> itemList = Provider.of<ProductsProvider>(context).items;
    List<Product> favoritesList =
        itemList.where((element) => element.isFavorite == true).toList();
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: favoritesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoritesList[index].title),
          );
        },
      ),
    );
  }
}
