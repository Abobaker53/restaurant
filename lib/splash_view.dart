import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5CB58),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/logo.svg"),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("YUM",style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 35,
                color: Color(0xffFF642F)
              ),
              ), Text("QUICK",style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 35,
                color: Colors.white,
              ),
              ),

            ],
          )
        ],
      ),

    );
  }
}
