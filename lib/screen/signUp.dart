import 'package:flutter/material.dart';
import 'package:flutter_ui/screen/order_food.dart';
import 'package:flutter_ui/util/data.dart';
import 'package:flutter_ui/util/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController createEmail = TextEditingController();
  final TextEditingController createPass = TextEditingController();
  final TextEditingController createName = TextEditingController();
  final TextEditingController createPhone = TextEditingController();

  bool pass = true;
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height*0.75,
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
                  Text("Create Account",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),),
                  const SizedBox(height: 15,),
                  MyField.textField("Full Name","abc", createName, TextInputType.name, createName.text.length > 0),
                  MyField.textFieldPhone("Phone Number","99.....99", createPhone, const TextInputType.numberWithOptions(signed: true,decimal: true), createPhone.text.length == 10),
                  MyField.textField("Email Address","abc@gmail.com", createEmail, TextInputType.emailAddress, createEmail.text.length > 5 && createEmail.text.contains("@") && createEmail.text.contains(".")),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                          child: Text("Password",
                            style: GoogleFonts.montserrat(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
                        ),
                        TextFormField(
                          controller: createPass,
                          cursorColor: Colors.deepPurpleAccent,
                          keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: false),
                          obscureText: pass,
                          decoration: InputDecoration(
                            hintText: " " + "*******",
                            hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  pass = !pass;
                                });
                              },
                              child: pass ?
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
                            if(_!.length < 6){
                              return "Invalid text";
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
                  ),
                  // textFieldPass("Password","*******", create_pass, TextInputType.text, create_pass.text.length >= 6,1),
                  const SizedBox(height: 25,),
                  errorMsg != "" ?
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(errorMsg,
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        ),),
                    ),
                  ) : const SizedBox(),
                  load == false ?
                  InkWell(
                    onTap: () async{
                      setState(() {});
                      errorMsg = "";

                      if(!(createPhone.text.length == 10)){
                        errorMsg = "Invalid Phone Number";
                      }

                      if(createName.text.length == 0){
                        errorMsg = "Empty Name";
                      }

                      if(!(createPass.text.length >= 3)){
                        errorMsg = "Invalid Password";
                      }

                      if(!(createEmail.text.length > 5 && createEmail.text.contains("@") && createEmail.text.contains("."))){
                        errorMsg = "Invalid Email";
                      }

                      if(errorMsg != ""){
                        showError();
                        return;
                      }

                      setState(() => load = true);
                      Map<String,dynamic> data = await MyData.signUp(createEmail.text, createPass.text, createName.text, createPhone.text);
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
                      child: Text("Sign Up",
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
                  Text("I'm already a member. ",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),),
                  InkWell(
                    onTap: (){
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).pop();
                    },
                    child: Text("Sign In",
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
    );
  }

  nav(Map<String,dynamic> data){
    print(data);
    if(data.containsKey("status") && data["status"] == true){
      Navigator.push(context,
          PageTransition(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
            type: PageTransitionType.rightToLeft,
            child: const OrderFood(),
          ));
    }else{
      setState(() {
        errorMsg = "Something went Wrong";
      });
      showError();
    }
  }

  String errorMsg = "";

  showError(){
    Future.delayed(const Duration(milliseconds: 2000),(){
      setState(() {
        errorMsg = "";
      });
    });
  }

}
