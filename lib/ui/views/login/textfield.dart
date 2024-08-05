import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  MyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.focusNode,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        cursorColor: Colors.white,
        focusNode: focusNode,
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.white),  // Set the text color to white
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.white) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
