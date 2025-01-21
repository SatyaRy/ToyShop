import 'package:flutter/material.dart';
// ignore: must_be_immutable
class OrderBox extends StatelessWidget {
  final String detail;
  final Icon icon;
  void Function()? onTap;
  OrderBox(
      {required this.onTap,
      required this.detail,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.4,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
             boxShadow:const [
              BoxShadow(
                  color:  Color.fromARGB(255, 201, 201, 201),
                  offset: Offset(0, 1),
                  spreadRadius: 1
                )],
            color: Theme.of(context).colorScheme.onSecondary
        ),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(
              detail,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
