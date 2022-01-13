import 'package:flutter/material.dart';
import 'package:machine_test/model/cart_model.dart';
import 'package:machine_test/model/restaurant_response.dart';
import 'package:machine_test/services.dart/restaurant_service.dart';
import 'package:machine_test/widgets/user-home-screen/cart_button.dart';
import 'package:machine_test/widgets/user-home-screen/dish_card.dart';
import 'package:machine_test/widgets/user-home-screen/profile_container.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  List<CartModel> cartList = [];

  bool isElementPresent(CartModel data) {
    return cartList
        .every((dish) => dish.dishData.dishId != data.dishData.dishId);
  }

  int getPresentElement(CartModel data) {
    return cartList.indexOf(cartList.firstWhere(
        (cartData) => cartData.dishData.dishId == data.dishData.dishId));
  }

  int getCartCount() {
    int count = 0;

    for (CartModel data in cartList) {
      count += data.count;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RestaurantResponse>>(
        future: RestaurantService.getRestaurantData(),
        builder: (context, responseData) {
          if (responseData.hasError || !responseData.hasData) {
            return const SizedBox.shrink();
          }

          return DefaultTabController(
            length: responseData.data![0].tableMenuList.length,
            child: Scaffold(
              drawer: Drawer(
                child: Column(
                  children: [
                    const ProfileContainer(
                      id: 23,
                      userName: "MohammedMohammedMohammed",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        "Log out",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
              appBar: AppBar(
                bottom: TabBar(
                  isScrollable: true,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  indicatorColor: const Color(0xFFDC4964),
                  labelColor: const Color(0xFFDC4964),
                  unselectedLabelColor: const Color(0xFF848488),
                  tabs: List.generate(
                    responseData.data![0].tableMenuList.length,
                    (index) => Tab(
                      text: responseData
                          .data![0].tableMenuList[index].menuCategory,
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.grey),
                actions: [
                  CartButton(
                    cartCount: getCartCount(),
                  )
                ],
              ),
              body: TabBarView(
                children: List.generate(
                  responseData.data![0].tableMenuList.length,
                  (pageIndex) => ListView.separated(
                    itemBuilder: (context, index) => DishCard(
                        onDishAddition: (data) {
                          if (!isElementPresent(data)) {
                            final index = getPresentElement(data);
                            setState(() {
                              if (data.count > 0) {
                                cartList[index] = data;
                              } else {
                                cartList.removeAt(index);
                              }
                            });

                            return;
                          }
                          if (data.count > 0) {
                            setState(() {
                              cartList.add(data);
                            });

                            return;
                          }
                        },
                        dishData: responseData.data![0].tableMenuList[pageIndex]
                            .categoryDishes[index]),
                    separatorBuilder: (context, index) => Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 5,
                        ),
                      ],
                    ),
                    itemCount: responseData.data![0].tableMenuList[pageIndex]
                        .categoryDishes.length,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
