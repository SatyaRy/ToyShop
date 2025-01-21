import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyshop/src/presentation/components/app_bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: authAppBar(context, "ការកំណត់",()=>Navigator.pop(context)),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            spacing: 20,
            children: [
              changeLanguage(width),
              optionalSetting(width,"ទទួលបានការជូនដំណឹង"),
              optionalSetting(width,"ទទួលបានការផ្តល់ជូនតាមអុីម៊ែល")
            ],
          ),
        ));
  }

  Container optionalSetting(double width,String detail) {
    return Container(
             padding: const EdgeInsets.only(left: 10,right: 10),
              width: width,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [ 
                  BoxShadow(
                    color: Color.fromARGB(255, 201, 201, 201),
                    offset: Offset(0, 1),
                    spreadRadius: 1)]
              ),
              child: Row(
                children: [
                 Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                  value: true, 
                  onChanged: (value){}),
                 ),
                 Text(detail, style: GoogleFonts.hanuman(
                  fontSize: 16
                 ))
                ],
              ),
            );
  }

  Container changeLanguage(double width) {
    return Container(
              padding: const EdgeInsets.only(top:20,left: 20,right: 20),
              width: width,
              height: 100,
              decoration: 
               BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white, 
                boxShadow: const [
                  BoxShadow(
                  color: Color.fromARGB(255, 201, 201, 201),
                  offset: Offset(0, 1),
                  spreadRadius: 1)
              ]),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ភាសា",style: GoogleFonts.hanuman(
                        fontSize: 15,

                      )),
                      Text("កែសម្រួល",style: GoogleFonts.hanuman(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color:const Color(0xff091970),
                      ))
                    ],
                  ),
                  Text("ខ្មែរ",style: GoogleFonts.hanuman(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ))
                ]
              ),
            );
  }
}
