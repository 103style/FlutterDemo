import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/catalog.dart';
import '../provider/catalog_model.dart';
import '../provider/theme.dart';
import '../provider/cart_model.dart';

void main() => runApp(ShopProviderDemo());

var title = 'ShopProviderDemo';

class ShopProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(builder: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          builder: (context, catalog, previousCart) =>
              CartModel(catalog, previousCart),
        )
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
