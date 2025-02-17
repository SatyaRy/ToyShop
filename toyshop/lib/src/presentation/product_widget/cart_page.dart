import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/components/cart_tile.dart';
import 'package:toyshop/src/presentation/modal_widget/handle_message.dart';
import 'package:toyshop/src/presentation/components/app_bar.dart';
import 'package:toyshop/src/provider/cart/cart.dart';
import 'package:toyshop/src/provider/transaction.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [MyAppBar(routing: "/home", onTap: () => Navigator.pop(context))],
          body: const Column(
            children: [
               CartTile(),
               TransactionTile()
            ],
          ),
        ));
  }
}

class TransactionTile extends ConsumerWidget {
  const TransactionTile({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              CheckoutDetail(
                  checkoutTopic: "សេវានិងពន្ធដារ", totalCost: "\$ 1"),
              const SizedBox(
                height: 20,
              ),
              CheckoutDetail(
                checkoutTopic: "សេវាដឹកជញ្ជូន",
                totalCost: "មិនគិតថ្លៃ",
              ),
              const SizedBox(
                height: 20,
              ),
              CheckoutDetail(
                checkoutTopic: "សរុប",
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
          style: GoogleFonts.hanuman(
              fontSize: 18,
              color: const Color.fromARGB(255, 106, 106, 106),
              fontWeight: FontWeight.bold)),
      Text(totalCost,
          style: const TextStyle(
              fontFamily: "sfpro", fontSize: 18, fontWeight: FontWeight.bold)),
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
      decoration: const BoxDecoration(color: Color(0xff00A800)),
      child: Center(
          child: Text(
        "ពិនិត្យការទូទាត់ប្រាក់ឡើងវិញ",
        style: GoogleFonts.hanuman(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      )),
    );
  }
}

class CartTile extends ConsumerWidget {
  const CartTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(getCartItemsProvider);
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: cart.when(
              data: (value) => ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final data = value[index];
                    return CartList(cartDetail: data);
                  }),
              error: (error, stackTrace) => Text("$error"),
              loading: () => const BuildLoadingWidget())),
    );
  }
}
