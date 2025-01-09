// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/src/components/handle_message.dart';
import 'package:toyshop/src/provider/auth.dart';
import 'package:toyshop/src/theme/colors.dart';

class SigninPage extends ConsumerWidget {
  SigninPage({super.key});
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        topContainer(context),
        authContainer(context, ref),
        Positioned(
            left: 100,
            bottom: 40,
            child: CachedNetworkSVGImage(
              width: 200,
              height: 200,
              "https://res.cloudinary.com/dnydodget/image/upload/v1736257762/skz_squid_2_yaudpw.svg")),
        Positioned(
            left: 200,
            bottom: 180,
            child:CachedNetworkSVGImage(
              width: 200,
              height: 200,
              "https://res.cloudinary.com/dnydodget/image/upload/v1736257762/skz_squid_2_yaudpw.svg")),
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
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Doesn't have an account?",
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/signup"),
                child: const Text("Sign up",
                    style: TextStyle(fontSize: 15, color: Color(0xff074799))),
              )
            ],
          ),
        ));
  }

  Widget authContainer(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authenticationProvider);
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
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff074799),
                            fontSize: 30)),
                    const SizedBox(
                      height: 30,
                    ),
                    textInput("Username", const Icon(Icons.person_outlined),
                        username),
                    const SizedBox(
                      height: 20,
                    ),
                    textInput(
                        "Password", const Icon(Icons.lock_outlined), password),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        authButton(
                          context,
                          "Back",
                          () {
                            Navigator.pushNamed(context, "/intro");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: authButton(context, "Sign in", () async {
                            try {
                              await authProvider.signInWithEmailAndPassword(
                                  email: username.text,
                                  password: password.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  HandleMessage(
                                          text: "Signin Successfully",
                                          color: AppColors.add)
                                      .build());
                              Navigator.pushNamed(context, "/home");
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  HandleMessage(
                                          text: "$e", color: AppColors.remove)
                                      .build());
                            }
                          }),
                        )
                      ],
                    )
                  ],
                ),
              ))),
    );
  }

  Widget topContainer(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xff074799)),
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
                  child: SvgPicture.network(
                      "https://res.cloudinary.com/dnydodget/image/upload/v1736318774/skz_squid_3_pho8nj.svg"),
                ),
              ),
            )),
      ),
    );
  }

  Widget authButton(
      BuildContext context, String authType, void Function()? route) {
    return GestureDetector(
      onTap: route,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xff074799),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            authType,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget textInput(
      String inputType, Icon iconType, TextEditingController authType) {
    return SizedBox(
      width: 370,
      height: 70,
      child: TextField(
        controller: authType,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(inputType),
            prefixIcon: iconType),
      ),
    );
  }

  Widget profile() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 132, 180, 219), shape: BoxShape.circle),
        child: Center(
          child: SvgPicture.network(
              "https://res.cloudinary.com/dnydodget/image/upload/v1736130486/cabybara_dnplgq.svg"),
        ),
      ),
    );
  }
}
