

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController textEditingController;
  final String hint;

  const MyTextField({super.key, required this.textEditingController, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}