import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyData{

  static Future<Map<String,dynamic>> signIn(String email, String pass) async{
    try{

      final response = await http.post(Uri.parse("https://snapkaro.com/eazyrooms_staging/api/userlogin"),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "user_email": email,
          "user_password": pass
        }),
      );

      Map<String,dynamic> data = jsonDecode(response.body);

      if(response.statusCode == 200 && data.containsKey("status") && data["status"] == true){
        return data;
      }else{
        return {};
      }

    }catch(e){
      print("Error: $e");
      return {};
    }
  }

  static Future<Map<String,dynamic>> signUp(String email, String pass, String name, String mobile) async{
    try{

      final response = await http.post(Uri.parse("https://snapkaro.com/eazyrooms_staging/api/user_registeration"),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "user_firstname": name,
          "user_email": email,
          "user_phone": mobile,
          "user_password": pass,
          "user_lastname": "ni",
          "user_city": "Hyderabad",
          "user_zipcode": "500072"

        }),
      );

      Map<String,dynamic> data = jsonDecode(response.body);

      if(response.statusCode == 200 && data.containsKey("status") && data["status"] == true){
        return data;
      }else{
        if(data.containsKey("msg")){
          return data;
        }else{
          return {};
        }
      }

    }catch(e){
      print("Error: $e");
      return {};
    }
  }

  static snackBar(BuildContext context,String s){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 4000),
        backgroundColor: Colors.deepPurpleAccent,
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Text(s,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

}