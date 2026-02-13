import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});
  
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    return TextFormField(
      controller:nameController,
      decoration: InputDecoration(
        label: Text('Enter your Name'),
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade400
        ),
        enabledBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
        )
      ),
    );
  }
}