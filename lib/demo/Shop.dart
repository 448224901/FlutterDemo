import 'package:flutter/material.dart';
import 'product.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) :super(key: key);
  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物清单'),
      ),
      body: ListView(
        children:
          widget.products.map((Product product) {
            return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged,
            );
          }).toList(),
      ),
    );
  }

}

final List<Product> _kProducts = <Product>[
  new Product('鸡蛋'),
  new Product('面粉'),
  new Product('巧克力脆片'),
];

main(){
  runApp(MaterialApp(
    title: 'listview',
    home: ShoppingList(products: _kProducts),
  ));
}