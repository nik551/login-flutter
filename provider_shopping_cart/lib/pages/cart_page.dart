import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_cart/modals/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.blue[200]),
                      child: ListTile(
                        title: Text(value.cartItems[index][0]),
                        // ignore: prefer_interpolation_to_compose_strings
                        subtitle: Text('Rs ' + value.cartItems[index][1]),
                        trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemsFromCart(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(36.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Rs ' + value.calculateTotal(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
