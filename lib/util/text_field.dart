import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyField{

  static textField(String mainName, String name,TextEditingController controller,TextInputType type,bool val,){
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
            decoration: InputDecoration(
              hintText: name,
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
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
    );
  }

  static textFieldPhone(String mainName, String name,TextEditingController controller,TextInputType type,bool val,){
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
            maxLength: 10,
            decoration: InputDecoration(
              hintText: name,
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
              ),
              counterText: "",
              prefixIcon: Padding(padding:const EdgeInsets.all(15),
                  child: Text('+91',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),)),
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
    );
  }

}