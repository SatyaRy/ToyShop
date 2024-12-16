 import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Dialog(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:  Container(
          width: 280,
          height: 70,
          decoration:  BoxDecoration(
            color: const Color.fromARGB(255, 4, 187, 10),
            borderRadius: BorderRadius.circular(10)
          ),
          child:const Padding(
            padding: EdgeInsets.only(left: 10),
            child:   Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Icon(Icons.check_circle,color: Colors.white,size: 40,),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Items added to cart",style:TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  )),
                )
            ],
          ),
          )
        ),
    );
  }
}