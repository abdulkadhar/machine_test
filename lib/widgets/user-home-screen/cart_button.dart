import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final int cartCount;
  const CartButton({
    Key? key,
    required this.cartCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          Positioned(
            right: 8,
            top: 6,
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Text(
                cartCount.toString(),
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
