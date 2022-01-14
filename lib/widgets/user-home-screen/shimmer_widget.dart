import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListLoader extends StatelessWidget {
  const ShimmerListLoader({Key? key}) : super(key: key);

  Widget shimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade500,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 30, height: 30, color: Colors.green),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.green,
                height: 15,
                width: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.green,
                    height: 15,
                    width: 100,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.green,
                    height: 15,
                    width: 100,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.green,
                height: 10,
                width: 150,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.green,
                height: 10,
                width: 150,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.green,
                height: 10,
                width: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.list),
        iconTheme: const IconThemeData(color: Colors.grey),
        actions: const [
          Icon(
            Icons.shopping_cart,
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        itemBuilder: (context, index) => shimmerCard(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 30,
        ),
        itemCount: 10,
      ),
    );
  }
}
