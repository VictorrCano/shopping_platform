import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/product_widget.dart';
import '../providers/products_provider.dart';
import './product_detail_screen.dart';
import './favorites_screen.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context, listen: false);
    final loadedProducts = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'Favorites',
            onPressed: () {
              Navigator.of(context).pushNamed(FavoritesScreen.route);
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: loadedProducts.length,
        padding: EdgeInsets.all(8.0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider.value(
            value: loadedProducts[index],
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                  ProductDetailScreen.route,
                  arguments: loadedProducts[index].id),
              child: ProductWidget(),
            ),
          );
        }),
      ),
    );
  }
}
