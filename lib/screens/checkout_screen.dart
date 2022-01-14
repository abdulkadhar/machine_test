import 'package:flutter/material.dart';
import 'package:machine_test/model/cart_model.dart';
import 'package:machine_test/services/restaurant_service.dart';
import 'package:machine_test/widgets/checkout_screen/checkout_dish_card.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartModel> productData;
  final int itemCount;
  const CheckoutPage({
    Key? key,
    required this.productData,
    required this.itemCount,
  }) : super(key: key);

  @override
  _CheckoutStatePage createState() => _CheckoutStatePage();
}

class _CheckoutStatePage extends State<CheckoutPage> {
  late List<CartModel> products;

  @override
  void initState() {
    super.initState();
    products = widget.productData;
  }

  double getTotalPrice(List<CartModel> productsData) {
    double total = 0;
    for (CartModel productData in productsData) {
      total += productData.count * productData.dishData.dishPrice;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF818286),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Order Summary",
          style: TextStyle(
            color: Color(0xFF818286),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                offset: Offset(1, 3),
                color: Colors.grey,
                blurRadius: 3,
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A3E15),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    products.length.toString() +
                        " Dishes - " +
                        widget.itemCount.toString() +
                        " items",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      CheckoutDishCard(data: products[index]),
                      const Divider(
                        height: 10,
                        thickness: 1.5,
                      )
                    ],
                  );
                }, childCount: products.length),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "INR " +
                            RestaurantService.convertSarToInr(
                              getTotalPrice(products),
                            ).toStringAsFixed(2),
                        style: const TextStyle(
                          color: Color(0xFF64A96D),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF1A3E15),
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Place Order",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
