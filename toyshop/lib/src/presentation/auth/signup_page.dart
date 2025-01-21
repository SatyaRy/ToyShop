// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/modal_widget/handle_message.dart';
import 'package:toyshop/src/provider/auth.dart';
import 'package:toyshop/src/theme/colors.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({super.key});
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Stack(children:
          [
            topContainer(context), 
            authContainer(context, ref)
          ]),
    );
  }
  Widget authContainer(BuildContext context, WidgetRef ref) {
    void handleSignup() async {
      if (password.text != confirm.text) {
        ErrorHandling.showSnackBar(
            context: context,
            text: "Password or email is empty",
            color: AppColors.remove);
      }
      try {
        await ref.read(authenticationProvider).signUpWithEmailAndPassword(
            email: email.text,
            password: password.text,
            username: username.text);
        ErrorHandling.showSnackBar(
            context: context, text: "Account is created", color: AppColors.add);
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/signin", (route) => false);
      } on FirebaseAuthException catch (e) {
        ErrorHandling.showSnackBar(
            context: context, text: "${e.message}", color: AppColors.remove);
      }
    }
    final width = MediaQuery.of(context).size.width;
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
            padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("បង្កើតគណនីប្រើប្រាស់",
                        style: GoogleFonts.hanuman(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff074799),
                            fontSize: 25)),
                const SizedBox( height: 40,),
                textInput(
                    width,
                    "ឈ្មោះ", 
                    
                    const Icon(Icons.person_outlined), 
                    username),
                const SizedBox( height: 20,),
                textInput(
                  width,"អីម៊ែល", 
                  const Icon(Icons.email_outlined), 
                  email),
                const SizedBox( height: 20,),
                signup(
                    width, ref, 
                    password,
                    const Icon(Icons.lock_outlined,), 
                    "លេខសម្ងាត់",true),
                const SizedBox(height: 20),
                signup(
                    width, ref, 
                    confirm,
                    const Icon(Icons.lock_outlined,color: Color(0xff212121)), 
                    "ផ្ទៀងផ្ទាត់លេខសម្ងាត់",false),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    authButton(
                        context,
                        "ត្រឡប់ក្រោយ",
                        () => Navigator.of(context).pushNamedAndRemoveUntil(
                        "/signin", (route) => false)),
                    authButton(context, "ចុះឈ្មោះ", handleSignup)
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0a33f9),
            Color(0xff091970),
          ]
        )),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: CachedNetworkSVGImage(
                    "https://res.cloudinary.com/dnydodget/image/upload/v1736318774/skz_squid_3_pho8nj.svg"
                  )
                ),
              )),
        ),
      ),
    );
  }
  Widget authButton(
    BuildContext context, 
    String authType,
    void Function()? route) {
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
                            offset: Offset(2, 2)
                          )
                        ],
            color: const Color(0xff0a33f9),
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
  Widget textInput(
    double width,
    String inputType, 
    Icon iconType, 
    TextEditingController authType) {
    return SizedBox(
      height: 70,
      child: TextField(
        
        controller: authType,
        decoration: InputDecoration(
            prefixIconColor:  const Color(0xff212121),
            border: OutlineInputBorder(
              
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
            label: Text(inputType,style:  GoogleFonts.hanuman(
                color: Colors.black
            ),),
            prefixIcon: iconType),
      ),
    );
  }

  Widget signup(
    double width, 
    WidgetRef ref,
    TextEditingController controller, 
    Icon iconType, 
    String inputType,
    bool isPassword) {
    final isVisible = ref.watch(isVisibleProvider);
    return SizedBox(
      width: width,
      height: 70,
      child: TextField(
        controller: controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
            prefixIconColor: const Color(0xff212121),
            suffixIconColor: const Color(0xff212121),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
            label: Text(
              inputType,
              style:  GoogleFonts.hanuman(
              color: const Color(0xff212121)
            )),
            prefixIcon: iconType,
            suffixIcon: isPassword? GestureDetector(
              onTap: () => ref.read(isVisibleProvider.notifier).isClick(),
              child: isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ): null),
      ),
    );
  }
}
