import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onButtonPressed;

  const MyButton({super.key, required this.buttonTitle, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  minimumSize: const Size(120, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
              ),
              autofocus: false,
              clipBehavior: Clip.none,
              onPressed: onButtonPressed,
              child: Text(buttonTitle)),
        ),
      ],
    );
  }
}
