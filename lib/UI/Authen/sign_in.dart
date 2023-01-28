import 'package:autox_flutter_training/Component/my_button.dart';
import 'package:autox_flutter_training/Component/my_text_field.dart';
import 'package:autox_flutter_training/Utils/utils.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(),
      home: const SignInContainer(
        title: 'Sign in',
      ),
    );
  }
}

class SignInContainer extends StatefulWidget {
  final String title;

  const SignInContainer({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _SignInContainer();
  }
}

class _SignInContainer extends State<SignInContainer> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign in ❤️❤️',
            ),
            MyTextField(textEditingController: emailController, hint: 'Username',),
            MyTextField(textEditingController: passwordController, hint: 'Password',),
            MyButton(buttonTitle: 'Sign in', onButtonPressed: prepareToSignIn),
          ],
        ),
      ),
    );
  }

  void prepareToSignIn(){
    //check email format
    if (Utils().validateEmailFormatter(emailController.text)){
      //save user data

    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
