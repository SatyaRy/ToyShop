import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/components/clip_path.dart';
import 'package:toyshop/src/presentation/components/order_box.dart';
import 'package:toyshop/src/presentation/components/handle_message.dart';
import 'package:toyshop/src/provider/auth.dart';
import 'package:toyshop/src/provider/profile.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final userInfo = ref.watch(getUserInfoProvider);
    return Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        body:userInfo.when(
          data: (data)=> SizedBox(
          width: width,
          height: height,
          child: Stack(children: [
            clipPath(),
            userProfile(),
            userDetail(ref, context,data.username),
            information(context, height, width, ref)
          ]),
        ), 
          error: (error,StackTrace stacktrace)=>Text("$error"), 
          loading: ()=>buildLoadingWidget()
        ));
  }

  Widget userDetail(WidgetRef ref, BuildContext context,String username) {
    return Positioned(
        top: 200,
        left: 20,
        child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/userDetail");
                      },
                      child: Text("មើលគណនី",
                          style: GoogleFonts.hanuman(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    )
                  ],
                ),
      );
  }

  Widget information(
      BuildContext context, double height, double width, WidgetRef ref) {
    final appInfo = ref.watch(getAppInfoProvider);
    return Positioned(
      top: 250,
      left: 20,
      right: 20,
      child: appInfo.when(
        data: (data)=>SizedBox(
        height: height,
        width: width,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderBox(
                    onTap: () {},
                    detail: "កម្មង់",
                    icon: const Icon(Icons.list_alt_outlined)),
                OrderBox(
                    onTap: () {
                      Navigator.pushNamed(context, "/favorite");
                    },
                    detail: "ចូលចិត្ត",
                    icon: const Icon(Icons.favorite_outline))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderBox(
                    onTap: () {
                      Navigator.pushNamed(context, "/cart");
                    },
                    detail: "ការទូទាត់",
                    icon: const Icon(Icons.shopping_cart_outlined)),
                OrderBox(
                    onTap: () {
                      Navigator.pushNamed(context, "/setting");
                    },
                    detail: "ការកំណត់",
                    icon: const Icon(Icons.settings_outlined))
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ជាទូទៅ",
                    style: GoogleFonts.hanuman(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                helper(
                    width, const Icon(Icons.help_outline), "ជំនួយការអតិថិជន"),
                helper(
                    width, const Icon(Icons.help_outline), "ជំនួយការអតិថិជន"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(signoutProvider);
                    ref.invalidate(signoutProvider);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/intro", (Route<dynamic> route) => false);
                  },
                  child: Container(
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "ចាកចេញ",
                        style: GoogleFonts.hanuman(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text("Version ${data.version}")
              ],
            )
          ],
        ),
      ),
         error: (error,StackTrace stacktrace)=>Text("$error"), 
         loading: ()=>buildLoadingWidget())
    );
  }

  Widget helper(double width, Icon icon, String detail) {
    return Container(
      width: width,
      height: 70,
      decoration: const BoxDecoration(
          color: null, border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 15,
            children: [
              icon,
              Text(
                detail,
                style: GoogleFonts.hanuman(fontSize: 17),
              )
            ],
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }

  Widget routeBack(context, double width) {
    return Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/home", (Route<dynamic> route) => false);
            },
            child: Container(
              width: width * 0.3,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xff074799),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "ត្រឡប់ក្រោយ",
                  style: GoogleFonts.hanuman(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: width * 0.3,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xff074799),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "រក្សាទុក",
                  style: GoogleFonts.hanuman(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
            ),
          )
        ]);
  }

  Widget userProfile() {
    return Positioned(
        top: 150,
        right: 30,
        child: Center(
          child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xff074799),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: CachedNetworkSVGImage(
                  "https://res.cloudinary.com/dnydodget/image/upload/v1736318774/skz_squid_3_pho8nj.svg",
                  width: 100,
                  height: 100,
                ),
              )),
        ));
  }

  Widget clipPath() {
    return ClipPath(
      clipper: CustomizePath(),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xff074799)),
        height: 250,
      ),
    );
  }
}
