import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.buttontext});
  final VoidCallback? onTap;
// البروبيرتي دي هي فنكشن مش بتاخد باراميترز ومش برجع قيمة
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            buttontext,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
