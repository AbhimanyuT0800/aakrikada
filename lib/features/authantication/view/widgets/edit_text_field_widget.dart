import 'package:flutter/material.dart';

class EditTextFieldWidget extends StatelessWidget {
  const EditTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: validator,
        controller: controller,

        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
