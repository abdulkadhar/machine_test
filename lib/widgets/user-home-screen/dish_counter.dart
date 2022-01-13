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
        height: 30,
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
              child: const Text(
                "-",
                style: TextStyle(
                  fontSize: 46,
                  height: 0.8,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
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
              child: const Text(
                "+",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
