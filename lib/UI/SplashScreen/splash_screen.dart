import 'package:flutter/material.dart';

import '../../Utils/user_data_storage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenContainer(title: 'Flutter Demo Home Page'),
    );
  }
}

class SplashScreenContainer extends StatefulWidget {
  
  final String title;

  const SplashScreenContainer({super.key, required this.title});

  @override
  State<SplashScreenContainer> createState() => _SplashScreenContainer();
  
}

class _SplashScreenContainer extends State<SplashScreenContainer> {
  final UserDataStorage userDataStorage = UserDataStorage();

  @override
  void initState() {
    super.initState();
    //check User logged in
    isAlreadyLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Hello Flutter 😜',
            ),
          ],
        ),
      ),
    );
  }


  void isAlreadyLoggedIn() async {
    // bool isUserLoggedIn = false;
    bool isUserLoggedIn = await userDataStorage.isUserLoggedIn();
    debugPrint('isAlreadyLoggedIn = $isUserLoggedIn');
    if(isUserLoggedIn){
      //go to Home page
      //HomePage()
    }
    else {
      //go to Sign in page
      //SignIn()

    }
  }

}