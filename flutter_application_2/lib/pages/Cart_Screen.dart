import 'package:flutter/material.dart';
import 'package:flutter_application_2/modules/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: Cart.products.length,
        itemBuilder: (context, index) {
          final product = Cart.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(
                'Цена: ${(product.quantity * product.price).toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Количество: ${product.quantity}'),
                IconButton(
                  icon: Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    removeFromCart(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Итого: ${Cart.getTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeFromCart(int productIndex) {
    if (productIndex >= 0 && productIndex < Cart.products.length) {
      Cart.removeFromCart(Cart.products[productIndex]);
      // Обновляем состояние виджета, чтобы он перестроился и элемент пропал из интерфейса
      setState(() {});
    }
  }
}
