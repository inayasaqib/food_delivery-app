import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  SearchField({Key? key, required this. hintText, required this. controller, required this. prefixIcon, required this. focusNode, this. validator});

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
        decoration: InputDecoration(
            labelText: hintText,
            labelStyle: const TextStyle(
              color:Colors.white
            ),
            fillColor: const Color.fromARGB(255, 3, 1, 35),
            prefixIcon: prefixIcon != null? Icon(prefixIcon) : null,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(color: Colors.white),
            )
        ),
      ),
    );
  }
}