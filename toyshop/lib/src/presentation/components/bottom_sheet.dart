import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future bottomPop(
  BuildContext context,
  TextEditingController controller,
  String detail,
  String detailType,
  void Function()? onTap,
  ) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
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
                        width: width * 0.4,
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
                        width: width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff074799),
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
