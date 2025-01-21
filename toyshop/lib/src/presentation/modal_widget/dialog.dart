import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  String dialogText;
  Color dialogColor;
  DialogBox({
    super.key,
    required this.dialogText,
    required this.dialogColor,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: dialogColor,
              borderRadius: BorderRadius.circular(10)),
          child:  Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left:15),
                  child:  Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 40,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      dialogText,
                      style:  GoogleFonts.hanuman(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )),
    );
  }
}
