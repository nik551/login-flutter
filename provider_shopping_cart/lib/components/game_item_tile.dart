import 'package:flutter/material.dart';

class GameItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GameItemTile({Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(color:color[300]
        ),
      child: Column(children: [
        Image.asset(
          imagePath,
          height:100,
        ),
        Text(itemName),

        MaterialButton(
            onPressed: onPressed,
            color: color[800],
            child: Text(
              'Rs '+ itemPrice,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
        )

      ],
      ),
      ),
    );
  }
}
