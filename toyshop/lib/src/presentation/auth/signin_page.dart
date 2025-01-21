// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/modal_widget/handle_message.dart';
import 'package:toyshop/src/provider/auth.dart';
import 'package:toyshop/src/theme/colors.dart';

class SigninPage extends ConsumerWidget {
  SigninPage({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        topContainer(context),
        authContainer(context, ref),
        overlay(
            "https://res.cloudinary.com/dnydodget/image/upload/v1736257762/skz_squid_2_yaudpw.svg",
            left: 100,
            bottom: 40),
        overlay(
            "https://res.cloudinary.com/dnydodget/image/upload/v1736257762/skz_squid_2_yaudpw.svg",
            left: 200,
            bottom: 180),
        signin(context)
      ]),
    );
  }

  Widget signin(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                "មិនមានគណនី?",
                style: GoogleFonts.hanuman(
    
                  fontSize: 15),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/signup"),
                child:  Text("ចុះឈ្មោះអីឡូវ",
                    style: GoogleFonts.hanuman(
    
                      fontSize: 15, color: const Color(0xff074799))),
              )
            ],
          ),
        ));
  }

  Widget overlay(String url, {double? left, double? bottom}) {
    return Positioned(
        left: left,
        bottom: bottom,
        child: CachedNetworkSVGImage(
          url,
          width: 200,
          height: 200,
        ));
  }
  Widget authContainer(BuildContext context, WidgetRef ref) {
    final signinProvider = ref.watch(authenticationProvider);
    Future<void> handleSignin() async {
      if (email.text.isEmpty || password.text.isEmpty) {
        ErrorHandling.showSnackBar(
            context: context,
            text: "Password or email is empty",
            color: AppColors.remove);
      }
      try {
        await signinProvider.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        ErrorHandling.showSnackBar(
            context: context,
            text: "Successfully sign in ",
            color: AppColors.add);
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/home", (route) => false);
      } on FirebaseAuthException catch (e) {
        ErrorHandling.showSnackBar(
          context: context,
          text: "${e.message}",
          color: AppColors.remove,
        );
      }
    }
    final isVisible = ref.watch(isVisibleProvider);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 700,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ស្វាគមន៍ត្រឡប់មកវិញ",
                        style: GoogleFonts.hanuman(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff074799),
                            fontSize: 25)),
                    const SizedBox(height: 30,),
                    emailInput(context),
                    const SizedBox(height: 20,),
                    passwordInput(context, isVisible, ref),
                    const SizedBox(height: 20,),
                    bottomNavWidget(context, ref, handleSignin)
                  ],
                ),
              ))),
    );
  }
  Widget bottomNavWidget(
    BuildContext context, 
    WidgetRef ref, 
    Future<void> Function() handleSignin) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             authButton(context, "ត្រឡប់ក្រោយ", () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  "/intro", (route) => false);}, ref),
              authButton(
                    context, "ចូលគណនី", handleSignin, ref)
                ]);
  }

  Widget emailInput(
    BuildContext context) {
    return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: TextField(
                     controller: email,   
                     decoration: InputDecoration(
                      prefixIconColor:  const Color(0xff212121),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      label: Text("អីម៊ែល",style: GoogleFonts.hanuman(
                        color: const Color(0xff212121)
                      )),
                      prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                  );
  }

  Widget passwordInput(
    BuildContext context,
    bool isVisible, 
    WidgetRef ref) {
    return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: TextField(
                      controller: password,
                      
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                         suffixIconColor:  const Color(0xff212121),
                         prefixIconColor:  const Color(0xff212121),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                          label:  Text("ពាក្យសម្ងាត់",style: GoogleFonts.hanuman(
                          )),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              ref.read(isVisibleProvider.notifier).isClick();
                            },
                            child: isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          )),
                    ),
                  );
  }

  Widget topContainer(
    BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient:LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0a33f9),
            Color(0xff091970),
          ]
        ),
        ),
        child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: CachedNetworkSVGImage(
                    "https://res.cloudinary.com/dnydodget/image/upload/v1736318774/skz_squid_3_pho8nj.svg"
                  )
                ),
              ),
            )),
      ),
    );
  }

  Widget authButton(
    BuildContext context, 
    String authType,
    void Function()? route, WidgetRef ref) {
    return GestureDetector(
      onTap: route,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
        boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          offset: Offset(2, 2))],
        color:const Color(0xff0a33f9),
        borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            authType,
            style:  GoogleFonts.hanuman(
              color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
  
}
