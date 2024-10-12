import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    // ScaffoldMessenger دي المسؤولة عن عرض الشوسناكبار بتظهر فالسكافولد
    SnackBar(
      content: Text(message),
    ),
  );
}
