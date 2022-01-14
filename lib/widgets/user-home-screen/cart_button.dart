import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int cartCount;
  final VoidCallback onPress;
  const CartButton({
    Key? key,
    required this.cartCount,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          IconButton(
            onPressed: onPress,
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ),
          Positioned(
            right: 8,
            top: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text(
                cartCount.toString(),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
