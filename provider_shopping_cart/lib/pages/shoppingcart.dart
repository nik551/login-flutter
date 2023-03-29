import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_cart/modals/cart_model.dart';

import '../components/game_item_tile.dart';
import 'cart_page.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Cart'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
          return CartPage();
        },
      ),
        ),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Consumer<CartModel>(
              builder: (context,value,child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                  ),
              itemBuilder: (context,index) {
              return GameItemTile(
                itemName: value.shopItems[index][0],
                itemPrice: value.shopItems[index][1],
                imagePath: value.shopItems[index][2],
                color: value.shopItems[index][3],
                onPressed: () {
                  Provider.of<CartModel>(context,listen: false).
                  addItemsToCart(index);
                },
              );
                },
              );
            },
            ),
          )
        ],
      ),

    );
  }
}
