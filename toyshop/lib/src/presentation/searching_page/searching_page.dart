import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchingPage extends StatelessWidget {
  const SearchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: 100,
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.hanuman(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.search_outlined),
                      hintText: "ស្វែងរកទំនិញដែលអ្នកពេញចិត្ត"),
                ),
              ),
             
            ],
          ),
        )));
  }
}
