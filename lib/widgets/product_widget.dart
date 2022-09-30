import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/products_provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;

  ProductWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    print('product widget rebuild ' + product.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
          footer: GridTileBar(
              backgroundColor: Colors.black54,
              leading: Consumer<ProductsProvider>(
                builder: (context, provider, child) => IconButton(
                  icon: provider.getFavoriteStatus(product.id)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.yellow,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                  onPressed: () =>
                      Provider.of<ProductsProvider>(context, listen: false)
                          .switchFavoriteStatus(product.id),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
