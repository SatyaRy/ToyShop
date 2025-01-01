import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class Favorite extends StatelessWidget {
  const Favorite({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
              color: const Color(0xff074799),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: SvgPicture.asset("fix later")
                      )),
                 const Padding(
                      padding:  EdgeInsets.only(left: 15, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text("fix later",
                              style:
                                   TextStyle(color: Colors.white, fontSize: 15)),
                           SizedBox(
                            height: 2,
                          ),
                          Text("\$ fix later", style:  TextStyle(color: Colors.white))
                        ],
                      ))
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.favorite, size: 30, color: Colors.red),
              )
            ],
          ));
  }
}
