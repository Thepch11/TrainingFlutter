import 'package:autox_flutter_training/Component/my_button.dart';
import 'package:autox_flutter_training/Component/my_text_field.dart';
import 'package:autox_flutter_training/Component/popup_dialog.dart';
import 'package:autox_flutter_training/Utils/user_data_storage.dart';
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
  final PopupDialog popupDialog = PopupDialog();
  final UserDataStorage userDataStorage = UserDataStorage();
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
            MyTextField(
              textEditingController: emailController,
              hint: 'Username',
            ),
            MyTextField(
              textEditingController: passwordController,
              hint: 'Password',
            ),
            MyButton(buttonTitle: 'Sign in', onButtonPressed: prepareToSignIn),
          ],
        ),
      ),
    );
  }

  void prepareToSignIn() async {
    if (emailController.text.isEmpty) {
      //show popup error
      popupDialog.showErrorPopup(context, 'Email Error', "Please fill Email.");
      return;
    }

    //check email format
    if (!Utils().validateEmailFormatter(emailController.text)) {
      debugPrint('show popup error');
      //show popup error
      popupDialog.showErrorPopup(
          context, 'Email Error', "Incorrect formatter.");
      return;
    }

    if (passwordController.text.isEmpty) {
      //show popup error
      popupDialog.showErrorPopup(
          context, 'Password Error', "Please fill Password.");
      return;
    }

    //save user data
    await userDataStorage.saveUserLogIn();
    //then go to Home
    debugPrint('save user data ==> DONE');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
