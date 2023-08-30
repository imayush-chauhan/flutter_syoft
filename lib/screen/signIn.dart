import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/screen/order_food.dart';
import 'package:flutter_ui/screen/signUp.dart';
import 'package:flutter_ui/util/data.dart';
import 'package:flutter_ui/util/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  final bool signUp;
  const SignIn({Key? key, required this.signUp}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool passIcon = true;
  bool load = false;

  @override
  void initState() {
    super.initState();
    if(widget.signUp == true){
      Future.delayed(const Duration(milliseconds: 400),(){
        signUp();
      });
    }
  }

  signUp()async{
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context){
          return const SignUp();
        }).then((value) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/images/signIn.svg",height: MediaQuery.of(context).size.height*0.25,),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height*0.6,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Sign In",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),),
                        const SizedBox(height: 15,),
                        MyField.textField("Email Address","abc@gmail.com", email, TextInputType.emailAddress, true),
                        textFieldPass("Password","*******", pass, TextInputType.text, true),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password?",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),),
                        ),
                        const SizedBox(height: 25,),
                        load == false ?
                        InkWell(
                          onTap: ()async{
                            if(!(email.text.length > 5 && email.text.contains("@") && email.text.contains("."))){
                              MyData.snackBar(context, "Invalid Email");
                              return;
                            }

                            if(!(pass.text.length >= 3)){
                              MyData.snackBar(context, "Invalid Password");
                              return;
                            }

                            setState(() => load = true);
                            Map<String,dynamic> data = await MyData.signIn(email.text, pass.text);
                            nav(data);
                            setState(() => load = false);
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text("Sign In",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),),
                          ),
                        ) : Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(color: Colors.white,),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I'm a new user? ",
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),),
                        InkWell(
                          onTap: () {
                            signUp();
                          },
                          child: Text("Sign Up",
                            style: GoogleFonts.montserrat(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  nav(Map<String,dynamic> data){
    if(data.containsKey("status") && data["status"] == true){
      Navigator.push(context,
          PageTransition(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
            type: PageTransitionType.rightToLeft,
            child: const OrderFood(),
          ));
    }else{
      MyData.snackBar(context, "Something went wrong");
    }
  }

  textFieldPass(String mainName, String name,TextEditingController controller,TextInputType type,bool val){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Text(mainName,
              style: GoogleFonts.montserrat(
                color: Colors.black.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
          ),
          TextFormField(
            controller: controller,
            cursorColor: Colors.deepPurpleAccent,
            keyboardType: type,
            obscureText: passIcon,
            decoration: InputDecoration(
              hintText: name,
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
              ),
              suffixIcon: InkWell(
                onTap: (){
                  setState(() {
                    passIcon = !passIcon;
                  });
                },
                child: passIcon ?
                const Icon(Icons.visibility,color: Colors.deepPurpleAccent,) :
                const Icon(Icons.visibility_off,color: Colors.deepPurpleAccent,),
              ),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              contentPadding:
              const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            ),
            validator: (_){
              if(val == false){
                return "Invalid Password";
              }
              return null;
            },
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

}
