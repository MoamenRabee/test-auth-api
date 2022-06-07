import 'package:all_validations_br/all_validations_br.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:test_app/functions/functions.dart';
import 'package:test_app/views/screens/auth/talents.dart';
import 'package:test_app/views/widgets/widgets.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  AuthController controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/logo.png",width: 80,),
                  const SizedBox(height: 20.0,),
                  const Text(
                    "Personal information",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  TextFormCustom(
                    hintText: "Full Name",
                    controller: nameController,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0,),
                  TextFormCustom(
                    hintText: "Email Address",
                    controller: emailController,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Email is required";
                      }
                      if(AllValidations.isEmail(val) == false){
                        return "Enter the correct email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0,),
                  TextFormCustom(
                    hintText: "Moblie number",
                    controller: phoneController,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Moblie number is required";
                      }
                      if(val.length < 11){
                        return "Enter the correct Phone Number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0,),
                  TextFormCustom(
                    hintText: "Password",
                    controller: passwordController,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Password is required";
                      }
                      if(AllValidations.isStrongPassword(val) == false){
                        return "Enter the Strong Password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0,),
                  TextFormCustom(
                    hintText: "Gender",
                    controller: genderController,
                    validator: (val){
                      if(val!.isEmpty){
                        return "Gender is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25.0,),
                  CustomButtom(
                    onPressed: (){

                      if(formKey.currentState!.validate()){

                        controller.name = nameController.text.split(" ").first;
                        controller.email = emailController.text;
                        controller.password = passwordController.text;
                        controller.gender = genderController.text;
                        controller.phone = phoneController.text;

                        navigateTo(context,TalentsScreen());
                      }

                    },
                    text: "NEXT",
                  ),
                  const SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already a member?",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFEAA900)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}