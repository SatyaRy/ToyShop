import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/models/trending_model.dart';

// ignore: must_be_immutable
class CartList extends StatefulWidget {
  TrendingModel cartList;
  CartList({super.key, required this.cartList});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
    int items = 0;
    void increment() {
      setState(() {
        items++;
      });
    }
    void decrement() {
      setState(() {
        if (items > 0) {
        items--; // Prevent going below 0
      }
      });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 201, 201, 201),
                      borderRadius: BorderRadius.circular(7)),
                  child: SvgPicture.asset(widget.cartList.image),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.cartList.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const Text("soft-toy",
                        style:
                            TextStyle(color: Color.fromARGB(255, 86, 86, 86))),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$${widget.cartList.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(Icons.delete_outline,
                      size: 30, color: Colors.red),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:decrement,
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(0xffF72C5B),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(items.toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap:increment,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xff074799),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
