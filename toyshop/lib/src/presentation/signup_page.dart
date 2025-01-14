// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toyshop/src/components/handle_message.dart';
import 'package:toyshop/src/provider/auth.dart';
import 'package:toyshop/src/theme/colors.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({super.key});
  final username = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();

  void turnBack() {
    debugPrint("back");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Stack(children: [topContainer(context), authContainer(context, ref)]),
    );
  }

  Widget authContainer(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authenticationProvider);
    void handleSignup() async{
    final handleError =
      await authProvider.signUpWithEmailAndPassword(
      email: username.text,
      password: password.text);
      if (handleError == null) {
        Navigator.pushNamed(context, "/signin");
        ScaffoldMessenger.of(context).showSnackBar(
          HandleMessage(text: "Account successfully created", color: AppColors.add).build()
        );
       }
       else{
        ScaffoldMessenger.of(context).showSnackBar(
          HandleMessage(text: handleError, color: AppColors.remove).build()
        );
        }
    }
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
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                textInput(
                    "Username", const Icon(Icons.person_outlined), username),
                const SizedBox(
                  height: 20,
                ),
                textInput(
                    "Password", const Icon(Icons.lock_outlined), password),
                const SizedBox(
                  height: 20,
                ),
                textInput("Confirm Password", const Icon(Icons.lock_outlined),
                    confirm),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    authButton(
                      context,
                      "Back",
                      () {
                        Navigator.pushNamed(context, "/intro");
                      },
                    ),
                    authButton(context, "Sign up", handleSignup)
                  ],
                )
              ],
            ),
          )),
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
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.network(
                      "https://res.cloudinary.com/dnydodget/image/upload/v1736318774/skz_squid_3_pho8nj.svg"),
                ),
              )),
        ),
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
