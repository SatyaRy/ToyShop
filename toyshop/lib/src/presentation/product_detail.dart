import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:toyshop/src/components/dialog.dart';
import 'package:toyshop/src/theme/colors.dart';
var fatCowDetail =
    "The FatCow soft toy is a plush and cuddly representation of a cartoonish cow with an exaggeratedly round and chubby body, giving it a whimsical, adorable appearance. Its body is typically crafted from soft, velvety fabric, often featuring classic cow markings like black spots on a white background.";

class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  Color isColor = Colors.red;
  var favoriteIcon = const Icon(Icons.favorite_outline);
  bool isClick = false;
  void changeIcon() {
    isClick = !isClick;
    setState(() {
      favoriteIcon = isClick
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : const Icon(Icons.favorite_outline);
    });
    showDialog(
        context: context,
        builder: (context) => DialogBox(
            dialogText: isClick ? "Added to favorite" : "Removed from favorite",
            dialogColor: Colors.purple));
  }

  void addToCart() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
            dialogText: "Item added to cart", dialogColor: AppColors.add));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: const Color(0xffEEEEEE),
      body: Column(
        children: [
          imageDetail(),
          const SizedBox( height: 10,),
          detail(context)
        ],
      ),
    );
  }

  Widget detail(BuildContext context) {
    return Expanded(
          child: Container(
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 40, top: 25),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Fat Cow",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("\$1.99",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 7),
                      Text(
                        "4.8",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 20),
                child: Text(
                  fatCowDetail,
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: "sfpro",
           
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: addToCart,
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                          child: Text("Add to cart",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17)),
                        ),
                ),
                )
              )
            ],
          ),
        ));
  }

  Widget imageDetail() {
    return Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            children: [CachedNetworkSVGImage("s")],
          ),
        );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffEEEEEE),
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
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Row(
              children: [
                DetailHead(
                  detailIcon: const Icon(Icons.share),
                  isClick: changeIcon,
                ),
                const SizedBox(
                  width: 20,
                ),
                DetailHead(
                  detailIcon: favoriteIcon,
                  isClick: changeIcon,
                )
              ],
            ))
      ],
    );
  }
}

// ignore: must_be_immutable
class DetailHead extends StatelessWidget {
  Icon detailIcon;
  void Function()? isClick;
  DetailHead({
    super.key,
    required this.detailIcon,
    required this.isClick,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isClick,
        child: Container(
          height: 45,
          width: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0.5,
                  offset: Offset(1, 0.5),
                )
              ]),
          child: detailIcon,
        ));
  }
}
