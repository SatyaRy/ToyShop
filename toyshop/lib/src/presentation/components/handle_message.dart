import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ErrorHandling {
  static void showSnackBar({
    required BuildContext context,
    required String text,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )))));
  }

}

  Widget buildLoadingWidget() {
    return Center(
      child: LoadingAnimationWidget.stretchedDots(
          color: const Color(0xff074799), size: 80),
    );
  }