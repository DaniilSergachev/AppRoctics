import 'package:flutter/material.dart';
import 'package:flutter_application_2/modules/cart.dart';
import 'package:flutter_application_2/pages/list_screen.dart';
import 'package:flutter_application_2/pages/Cart_Screen.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.numb});

  final int numb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product_name[numb]),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(children: <Widget>[
              Expanded(flex: 3, child: Image.network(images_product[numb])),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 130),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Цена: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          product_price[numb],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 182, 2, 2),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView(children: <Widget>[
                  Text(
                    product_info[numb],
                    softWrap: true,
                  ),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                    child: const Text('Корзина'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      addToCart(context,numb);
                    },
                    icon: const Icon(Icons.shopping_cart,
                        size: 15), 
                    label: const Text('Добавить в корзину',), 
                 
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

 void addToCart(BuildContext context, int productIndex) {
    String productName = product_name[productIndex];
    double productPrice = double.parse(product_price[productIndex]);

    for (Product product in Cart.products) {
      if (product.name == productName) {
        product.quantity++;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Количество товара в корзине увеличено')),
        );
        return;
      }
    }

    Cart.addToCart(Product(name: productName, price: productPrice, quantity: 1));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Товар добавлен в корзину')),
    );
  }

