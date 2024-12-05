import 'package:flutter/material.dart';

class CustoTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String label;
  const CustoTextFormField({
    super.key,
    required this.keyboardType,
    this.validator,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
