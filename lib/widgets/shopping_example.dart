import 'package:flutter/material.dart';

import '../common/common_utils.dart';

var title = 'Shopping example';

void main() {
  runApp(ShoppingExample());
}

class ShoppingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonBackTitle(
      title: title,
      bodyWidget: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'rice'),
        Product(name: 'oil'),
      ],
    );
  }
}

class Product {
  final String name;

  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback callback;

  ShoppingListItem({Product product, this.inCart, this.callback})
      : product = product,
        super(key: ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.red : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle() {
    if (!inCart) {
      return null;
    }

    return TextStyle(
      color: Colors.red,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        callback(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCar = Set<Product>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: widget.products.map((Product product) {
        return ShoppingListItem(
          product: product,
          inCart: _shoppingCar.contains(product),
          callback: _handlerCartChanged,
        );
      }).toList(),
    );
  }

  void _handlerCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCar.remove(product);
      } else {
        _shoppingCar.add(product);
      }
    });
  }
}
