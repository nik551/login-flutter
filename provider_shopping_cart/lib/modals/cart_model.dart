import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  final List _shopItems =[
    ["Fifa 23","2000","lib/images/fifa.png",Colors.blue],
    ["Last of Us","3000","lib/images/last_of_us.jpg",Colors.blue],
    ["Uncharted","2000","lib/images/uncharted.jpg",Colors.blue],
    ["PS4","20000","lib/images/ps4.jpg",Colors.blue],
  ];
  List _cartItems =[];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemsToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  void removeItemsFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  String calculateTotal(){
    double totalPrice =0;
    for(int i=0;i<_cartItems.length;i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}