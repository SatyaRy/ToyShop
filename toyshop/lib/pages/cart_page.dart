import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/components/cart_list.dart';
import 'package:toyshop/providers/cart_items.dart';
import 'package:toyshop/providers/trending.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    var cartProvider = context.watch<TrendingProvider>();
    var cartList = cartProvider.favoriteList;
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      appBar: appBar(context),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    var cartList = cartProvider.userFavorite()[index];
                    return CartList(
                      cartList: cartList,
                    );
                  }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: () {
              var cartProvider = context.watch<CartItemProvider>();
              var itemCost = cartProvider.itemCost;
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        CheckoutDetail(
                          checkoutTopic: "SubTotal",
                          totalCost: itemCost.toString(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CheckoutDetail(
                          checkoutTopic: "Delivery",
                          totalCost: "Free",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CheckoutDetail(
                          checkoutTopic: "Total",
                          totalCost: itemCost.toString(),
                        ),
                      ],
                    ),
                  ),
                  Transaction()
                ],
              );
            }(),
          )
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xffEEEEEE),
        title: const Text("Cart Page",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.only(left: 5),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 0.5,
                    offset: Offset(1, 0.5),
                  )
                ]),
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
          ),
        ));
  }
}

class CheckoutDetail extends StatelessWidget {
  CheckoutDetail({
    super.key,
    required this.checkoutTopic,
    required this.totalCost,
  });
  String checkoutTopic;
  String totalCost;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(checkoutTopic,
          style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 106, 106, 106),
              fontWeight: FontWeight.w600)),
      Text(totalCost,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    ]);
  }
}

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: Colors.green),
      child: Center(
          child: Text(
        "Procced to check out",
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
