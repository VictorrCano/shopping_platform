import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/marketplace_overview_screen.dart';
import './providers/products_provider.dart';
import './screens/product_detail_screen.dart';
import './screens/favorites_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        //home: MyHomePage(),
        routes: {
          '/': (context) => MarketplaceScreen(),
          ProductDetailScreen.route: (context) => ProductDetailScreen(),
          FavoritesScreen.route: (context) => FavoritesScreen(),
        },
      ),
    );
  }
}
