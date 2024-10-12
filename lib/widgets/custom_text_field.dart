import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.isEditable = true,
      this.inputType,
      this.controller});
  final Function(String)? onChanged; // دي فنكشن اختيارية
  final String? hintText;

  final TextInputType? inputType;
  final bool? obscureText;
  final bool? isEditable;
  final TextEditingController? controller; // هنا نحدد controller

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // علشان امسك التيكست من مكانلمكان
      keyboardType: inputType, // بتاعت كتابة الارقام
      obscureText: obscureText!,
      // validator: (data) { // شلته علشان انا مش لازم اتاكد ان هو فاضي او لا علشان بعمل ابديت
      //   if (data!.isEmpty) {
      //     return 'field is required';
      //   }
      //   return null;
      // },
      onChanged: onChanged,
      //تُستخدم لتعريف فنكشن (كولباك) يتم استدعاؤها كلما تغير النص
      enabled: isEditable,
      decoration: InputDecoration(
        hintText: hintText,
        // hintStyle: const TextStyle(
        //   color: Colors.blue,
        // ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
