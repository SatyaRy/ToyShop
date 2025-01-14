import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toyshop/src/presentation/components/cart_list.dart';
import 'package:toyshop/src/presentation/components/handle_message.dart';
import 'package:toyshop/src/presentation/components/silver_appbar.dart';
import 'package:toyshop/src/model/product/product.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/transaction.dart';

class CartPage extends ConsumerWidget {
  CartPage({super.key});

  final controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [MyAppBar(pageDetail: "Cart Page",routing: "/home" )],
          body: Column(
            children: [
              cartItems(ref),
              transaction(ref),
            ],
          ),
        ));
  }

  Widget cartItems(WidgetRef ref) {
    final cartItems = ref.watch(getCartItemsProvider);
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: cartItems.when(
              data: (value) => ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final data = value[index];
                    final CartModel cartDetail = CartModel(
                        productID: data.productID,
                        productImage: data.productImage,
                        productName: data.productName,
                        productPrice: data.productPrice,
                        productQuantity: data.productQuantity,
                        timeStamp: data.timeStamp);
                    return CartList(cartDetail: cartDetail);
                  }),
              error: (error, stackTrace) => Text("$error"),
              loading: () => buildLoadingWidget()
              )),
    );
  }

  Widget transaction(WidgetRef ref) {
    final total = ref.watch(totalProvider);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              color: Colors.white),
          child: Column(
            children: [
              CheckoutDetail(checkoutTopic: "SubTotal", totalCost: "\$ 1"),
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
                totalCost: "\$  ${total.toStringAsFixed(2)}",
              ),
            ],
          ),
        ),
        const Transaction()
      ],
    );
  }
}

// ignore: must_be_immutable
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
      decoration: const BoxDecoration(color: Colors.green),
      child: const Center(
          child: Text(
        "Procced to check out",
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
