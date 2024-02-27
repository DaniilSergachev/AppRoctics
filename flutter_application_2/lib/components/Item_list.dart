import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/product_cart.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.images, required this.name, required this.index_numer, required this.price});

final String images;
final String name;
final int index_numer;
final String price;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
         Expanded(
          flex: 1, 
          child: Image.network(images, width: 380, height: 240,),
),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      const Text(
                        "Цена:   ",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      Text(
                                price,
                                style:const TextStyle(color:  Color.fromARGB(255, 182, 2, 2),fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                    ],
                  ),
                ),
             Container(
              padding:const EdgeInsets.all(8),
               child: Text(name, 
               style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
               ),
             ),
                ElevatedButton(
                    onPressed: (){Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ProductCart(numb: index_numer)),
                              );}, 
                    child:const Text('Подробнее')
                    ),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
}