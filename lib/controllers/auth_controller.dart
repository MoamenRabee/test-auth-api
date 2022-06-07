import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/functions/dio_helper.dart';
import 'package:test_app/functions/functions.dart';
import 'package:test_app/views/screens/auth/login.dart';

class AuthController extends GetxController{

  List<String> allTalents = [
    "Actor",
    "Photographer",
    "Graphic Designer",
    "Art Director",
    "Stylist & Fashion",
    "Makeup Artist",
    "Journalist",
    "Football Player",
    "Model",
    "Producer",
    "Director",
    "Videographer",
    "Editor",
    "Singer",
    "Colorist",
    "Sound Engineer",
    "Writer",
    "Production Manager",
    "Voice Over",
    "Other",
  ];

  bool isLoading = false;

  late String name;
  late String email;
  late String phone;
  late String password;
  late String gender;
  List<String> talents = [];


  void toggleTalents(String talent){
    if(talents.contains(talent)){
      talents.remove(talent);
    }else{
      talents.add(talent);
    }
    update();
  }


  void register(context) async {

    try{
      isLoading = true;
      update();

      var response = await DioHelper.postData(
        url: "https://gold-golio.herokuapp.com/talented_reg",
        data: {
          "full_name" : name,
          "email" : email,
          "phone" : phone,
          "password" : password,
          "gender" : gender,
          "talents" : talents,
        },
      );

      if(response!.data["errors"] != null){
        List errors = response.data["errors"];
        for (var element in errors) {
          showMessage(message: element["param"] + " is " + element["msg"], color: Colors.red);
        }
      }else{
        if(response.data["message"] == "Email is exsit"){
          showMessage(message: response.data["message"], color: Colors.red);
        }else{
          showMessage(message: response.data["message"], color: Colors.green);
          navigateOff(context,const LoginScreen());
        }
      }


    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }finally{
      isLoading = false;
      update();
    }


  }


}