import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/screen/signIn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Choose extends StatelessWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 400 ?
    const ChooseMobile() : const ChooseTab();
  }

}

class ChooseMobile extends StatelessWidget {
  const ChooseMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                top(context),

                Text("Best way to invest Your Money!",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800
                  ),),

                button(context),

              ],
            ),
          ),
        ),
      ),
    );
  }

  top(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("My Cantor.",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800
              ),),
            SvgPicture.asset("assets/images/choose.svg",width: MediaQuery.of(context).size.width*0.9,),
          ],
        ),
      ),
    );
  }

  button(BuildContext context){
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context,
                PageTransition(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeIn,
                  type: PageTransitionType.rightToLeft,
                  child: const SignIn(signUp: true,),
                ));
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width*0.75,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text("Sign Up",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),),
          ),
        ),

        const SizedBox(height: 20,),

        InkWell(
          onTap: (){
            Navigator.push(context,
                PageTransition(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeIn,
                  type: PageTransitionType.rightToLeft,
                  child: const SignIn(signUp: false,),
                ));
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width*0.75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text("Sign In",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
              ),),
          ),
        ),
      ],
    );
  }
}

class ChooseTab extends StatelessWidget {
  const ChooseTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                top(context),

                button(context),

              ],
            ),
          ),
        ),
      ),
    );
  }

  top(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("My Cantor.",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800
              ),),
            SvgPicture.asset("assets/images/choose.svg",width: MediaQuery.of(context).size.width*0.4,),
          ],
        ),
      ),
    );
  }

  button(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Best way to invest Your Money!",
          style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w800
          ),),
        const SizedBox(height: 20,),
        InkWell(
          onTap: (){
            Navigator.push(context,
                PageTransition(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeIn,
                  type: PageTransitionType.rightToLeft,
                  child: const SignIn(signUp: true,),
                ));
          },
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width*0.3,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text("Sign Up",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),),
          ),
        ),

        const SizedBox(height: 20,),

        InkWell(
          onTap: (){
            Navigator.push(context,
                PageTransition(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeIn,
                  type: PageTransitionType.rightToLeft,
                  child: const SignIn(signUp: false,),
                ));
          },
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width*0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text("Sign In",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),),
          ),
        ),
      ],
    );
  }
}

