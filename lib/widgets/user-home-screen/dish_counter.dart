import 'package:flutter/material.dart';

class CartAddButton extends StatefulWidget {
  final Function(int) onValueChange;
  const CartAddButton({Key? key, required this.onValueChange})
      : super(key: key);

  @override
  _CartAddButtonState createState() => _CartAddButtonState();
}

class _CartAddButtonState extends State<CartAddButton>
    with AutomaticKeepAliveClientMixin<CartAddButton> {
  @override
  bool get wantKeepAlive => true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(40),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.green,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 15),
            InkWell(
              onTap: () {
                setState(() {
                  count--;
                });
                widget.onValueChange(count);
              },
              child: const Icon(Icons.remove, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {
                setState(() {
                  count++;
                });
                widget.onValueChange(count);
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
