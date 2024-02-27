class Product {
  final String name;
  final double price;
  int quantity;

  Product({required this.name, required this.price, this.quantity = 0});
}

class Cart {
  static final List<Product> _products = [];

  static List<Product> get products => _products;

  static void addToCart(Product product) {
    _products.add(product);
  }

  static void removeFromCart(Product product) {
    _products.remove(product);
  }

  static double getTotalPrice() {
    return _products.fold(0, (previousValue, element) => previousValue + (element.price * element.quantity));
  }
}
