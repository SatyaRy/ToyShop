import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/modal_widget/bottom_sheet.dart';
import 'package:toyshop/src/presentation/modal_widget/handle_message.dart';
import 'package:toyshop/src/presentation/components/app_bar.dart';
import 'package:toyshop/src/provider/auth.dart';
import 'package:toyshop/src/provider/profile.dart';

class UserDetailPage extends ConsumerWidget {
  const UserDetailPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoProvider);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar:
            authAppBar(context, "ប្រវត្តិរូប", () => Navigator.pop(context)),
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: userInfo.when(
                data: (data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        detailBox(
                          context,
                          "ឈ្មោះ",
                          data.username,
                          false,
                          ref,
                          "username",
                          data.uid,
                        ),
                        detailBox(context, "អុីម៊ែល", data.email, true, ref,
                            "email", data.uid),
                        detailBox(context, "លេខទូរស័ព្ទ", "", false, ref,
                            "phoneNumber", data.uid),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("គណនីដែលបានភ្ជាប់",
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                        socialMedia(
                            width,
                            "https://res.cloudinary.com/dnydodget/image/upload/v1737176790/icons8-facebook_n76xlr.svg",
                            "Facebook",
                            context),
                        socialMedia(
                            width,
                            "https://res.cloudinary.com/dnydodget/image/upload/v1737176608/icons8-google_c2nd1b.svg",
                            "Google",
                            context),
                        Center(
                            child: TextButton(
                          onPressed: () {
                            deleteBottomPop(
                              context,
                              () => ref.read(deleteAccountProvider(data.uid)),
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/intro", (Route<dynamic> route) => false);
                          },
                          child: Text("លុបគណនីរបស់ខ្ញុំ",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ))
                      ],
                    ),
                error: (error, StackTrace stackTrace) => Text("$error"),
                loading: () => buildLoadingWidget())));
  }

  Widget socialMedia(
      double width, String icon, String detail, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      width: width,
      height: 80,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 201, 201, 201),
                offset: Offset(0, 1),
                spreadRadius: 1)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15,
            children: [
              CachedNetworkSVGImage(
                icon,
                width: 30,
                height: 30,
              ),
              Text(
                detail,
                style: const TextStyle(
                  fontFamily: "sfpro",
                  fontSize: 18,
                ),
              )
            ],
          ),
          const Icon(Icons.clear)
        ],
      ),
    );
  }

  Widget detailBox(
    BuildContext context,
    String detailType,
    String detail,
    bool isVerified,
    WidgetRef ref,
    String infoType,
    String uid,
  ) {
    final width = MediaQuery.of(context).size.width;
    final TextEditingController controller = TextEditingController();
    void onTap() {
      ref.read(updateInfoProvider((
        uid: uid,
        infoType: infoType,
        newInfo: controller.text,
      )));
      ref.invalidate(getUserInfoProvider);
      Navigator.pop(context);
    }

    return Container(
      width: width,
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 110,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 201, 201, 201),
                offset: Offset(0, 1),
                spreadRadius: 1)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 3,
            children: [
              Text(detailType,
                  style: GoogleFonts.hanuman(
                      color: const Color(0xff091970),
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              Text(
                detail,
                style: const TextStyle(
                    fontFamily: "sfpro",
                    fontSize: 20,
                    color: Color(0xff212121),
                    fontWeight: FontWeight.bold),
              ),
              isVerified
                  ? Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 174, 255, 176),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        isVerified ? "បានផ្ទៀងផ្ទាត់" : "",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          GestureDetector(
            onTap: () =>
                bottomPop(context, controller, detail, detailType, onTap),
            child: const Icon(Icons.edit_outlined),
          )
        ],
      ),
    );
  }
}
