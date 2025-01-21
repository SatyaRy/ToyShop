import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future bottomPop(
  BuildContext context,
  TextEditingController controller,
  String detail,
  String detailType,
  void Function()? onTap,
) {
  final size = MediaQuery.of(context).size;
  final width = size.width;
  final height = size.height;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("កែប្រែឈ្មោះ",
                    style: GoogleFonts.hanuman(
                        fontWeight: FontWeight.bold, fontSize: 25)),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: detail,
                      label: Text(
                        detailType,
                        style: GoogleFonts.hanuman(),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: width * 0.3,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("បោះបង់",
                              style: GoogleFonts.hanuman(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: width * 0.3,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  offset: Offset(2, 3))
                            ],
                            color: const Color(0xff0a33f9),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text("រក្សាទុក",
                              style: GoogleFonts.hanuman(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ));
      });
}

Future deleteBottomPop(
  BuildContext context,
  void Function()? onTap,
) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: const Color(0xffEEEEEE),
          width: width,
          height: height * 0.3,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                child: CachedNetworkSVGImage(
                    width: 100,
                    "https://res.cloudinary.com/dnydodget/image/upload/v1737343043/Untitled_design_10_krgrsi.svg"),
              ),
              Positioned(
                  top: 80,
                  child: Text("តើអ្នកប្រាកដដែរឬទេ?",
                      style: GoogleFonts.hanuman(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              Positioned(
                  top: 150,
                  child: Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      offset: Offset(1, 2))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("បោះបង់",
                                  style: GoogleFonts.hanuman(fontSize: 15)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      offset: Offset(1, 2))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text("បន្ត",
                                  style: GoogleFonts.hanuman(
                                      fontSize: 15, color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        );
      });
}
