import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/presentation/components/dialog.dart';

class ItemDetail extends StatefulWidget {
  ItemDetail({super.key});

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
          :const Icon(Icons.favorite_outline);
      ;
    });
    showDialog(
        context: context,
        builder: (context) => DialogBox(
            dialogText: isClick? "Added to favorite":"Removed from favorite", dialogColor: Colors.purple));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: const Color(0xffEEEEEE),
      body: Container(
        child: Column(
          children: [
            Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            decoration:const BoxDecoration(
            ),
            child:Column(
              children: [
                SvgPicture.asset("lib/presentation/assets/icons/fatcow.svg",width: 300,height: 300,fit:  BoxFit.cover,)
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 40,top: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))
              ),
              child:  Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  const Text("Fat Cow",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 5,),
                  const Text("\$1.99",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 10,),
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: Colors.white,size: 20,),
                        SizedBox(width: 7),
                        Text("4.8",style: TextStyle(
                          color: Colors.white
                        ),)
                      ],
                    )
                  )
                ],
              ),
            )
          )
          ],
        )
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
            padding: EdgeInsets.only(right: 35),
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
