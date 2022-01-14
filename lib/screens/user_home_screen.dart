import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/model/cart_model.dart';
import 'package:machine_test/model/restaurant_response.dart';
import 'package:machine_test/model/user_model.dart';
import 'package:machine_test/screens/checkout_screen.dart';
import 'package:machine_test/screens/login_screen.dart';
import 'package:machine_test/services/login_service.dart';
import 'package:machine_test/services/restaurant_service.dart';
import 'package:machine_test/widgets/user-home-screen/cart_button.dart';
import 'package:machine_test/widgets/user-home-screen/dish_card.dart';
import 'package:machine_test/widgets/user-home-screen/profile_container.dart';
import 'package:machine_test/widgets/user-home-screen/shimmer_widget.dart';


class UserHomeScreen extends StatefulWidget {
  final UserModel model;
  const UserHomeScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

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

  String handleUserName() {
    final currentUserName = widget.model.userName;
    final currentPhoneNumber = widget.model.phoneNumber;
    if (widget.model.type == AuthType.google && currentUserName != null) {
      return currentUserName;
    }
    if (widget.model.type == AuthType.phoneNumber &&
        currentPhoneNumber != null) {
      return currentPhoneNumber;
    }
    return "Guest user";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RestaurantResponse>>(
        future: RestaurantService.getRestaurantData(),
        builder: (context, responseData) {
          if (responseData.hasError || !responseData.hasData) {
            return const ShimmerListLoader();
          }

          return DefaultTabController(
            length: responseData.data![0].tableMenuList.length,
            child: Scaffold(
              drawer: Drawer(
                child: Column(
                  children: [
                    ProfileContainer(
                      id: widget.model.uid,
                      userName: handleUserName(),
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
                      onTap: () async {
                        try {
                          if (widget.model.type == AuthType.google) {
                            await LoginService.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          }
                          auth.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        } catch (e) {
                          return;
                        }
                      },
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
                    onPress: () {
                      if (getCartCount() != 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              model: widget.model,
                              productData: cartList,
                              itemCount: getCartCount(),
                            ),
                          ),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please add product to cart"),
                        ),
                      );
                    },
                  ),
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
