import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {Key? key, required this.hintText, required this.icon, required this.type, required this.controller, this.obSecure = false, required this.validator})
      : super(key: key);
  final String hintText;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;
  final bool obSecure;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(

        hintText: hintText,
        filled: true,

        prefixIcon: Icon(icon),
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
      keyboardType: type,
      controller: controller,
      obscureText: obSecure,
      validator: validator,
    );
  }
}
