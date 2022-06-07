
import 'package:flutter/material.dart';
import 'package:test_app/views/themes/colors.dart';

// ignore: must_be_immutable
class TextFormCustom extends StatelessWidget {
  TextFormCustom({Key? key,required this.controller,required this.validator,required this.hintText,}) : super(key: key);

  TextEditingController controller = TextEditingController();
  FormFieldValidator<String>? validator;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration:  InputDecoration(
        hintText: hintText,
        border:  OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(0.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
 CustomButtom({Key? key,required this.onPressed,required this.text}) : super(key: key);


  VoidCallback onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 12),
        decoration: const BoxDecoration(
          color: mainColor,
        ),
        alignment: Alignment.center,
        child: Text(text,style: const TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.w700)),
      ),
    );
  }
}