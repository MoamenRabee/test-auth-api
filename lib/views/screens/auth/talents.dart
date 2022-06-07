import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:test_app/functions/functions.dart';
import 'package:test_app/views/themes/colors.dart';
import 'package:test_app/views/widgets/widgets.dart';

// ignore: must_be_immutable
class TalentsScreen extends StatelessWidget {
  TalentsScreen({Key? key}) : super(key: key);


  AuthController controller = Get.put(AuthController());
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: GetBuilder<AuthController>(
            builder: (_){
              if(controller.isLoading){
                return const Center(child: CircularProgressIndicator(color: mainColor,));
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/logo.png",width: 80,),
                    const SizedBox(height: 20.0,),
                    const Text(
                      "What talents do you have ?",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    const Text(
                      "Maximum of 3 talents can be selected",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Wrap(
                      children: [
                        ...List.generate(controller.allTalents.length, (index){
                          return InkWell(
                            onTap: (){
                              controller.toggleTalents(controller.allTalents[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: controller.talents.contains(controller.allTalents[index]) ? mainColor : Colors.white ,
                                border: Border.all(
                                  color: controller.talents.contains(controller.allTalents[index]) ? mainColor : Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                controller.allTalents[index],
                                style: TextStyle(
                                    color: controller.talents.contains(controller.allTalents[index]) ? Colors.white :  Colors.grey,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    CustomButtom(
                      onPressed: (){

                        if(controller.talents.isNotEmpty){
                          controller.register(context);
                        }else{
                          showMessage(message: "Please select from above", color: Colors.red);
                        }
                        
                      },
                      text: "SIGN UP",
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}