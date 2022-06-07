import 'package:flutter/material.dart';
import 'package:test_app/functions/functions.dart';
import 'package:test_app/views/screens/auth/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  const SizedBox(height: 30.0,),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  const Text(
                    "Let’s Share your talent with the world ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: double.infinity,
                      padding:const  EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign up with Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const Text(
                          "OR",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            padding:const  EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Image.asset("assets/images/google_logo.png",width: 40.0,),
                                const Text(
                                  "Sign up with Google",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0,),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            padding:const  EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Image.asset("assets/images/fb_logo.png",width: 40.0,),
                                const Text(
                                  "Sign up with Facebook",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        onPressed: (){
                          navigateTo(context,SignUpScreen());
                        },
                         child: const Text(
                          "Sign up",
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