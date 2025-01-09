import 'package:flutter/material.dart';

class HandleMessage{
  final String text;
  final Color color;
  HandleMessage({
    required this.text,
    required this.color,
  });
  SnackBar build() {
    return SnackBar(
        
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 10),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            )))
            );
  }
}
