
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "home_page",
      theme: ThemeData(),
      home: const HomePageContainer(),
    );
  }

}

class HomePageContainer extends StatefulWidget {
  final String? title;

  const HomePageContainer({super.key, this.title});

  @override
  State<StatefulWidget> createState() {
   return _HomePageContainer();
  }

}

class _HomePageContainer extends State<HomePageContainer>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl: 'https://source.unsplash.com/random/?university',
                fit: BoxFit.fill,
                width: 250,
           ),
              Expanded(
                child: ListView (
                  children: const <Widget>[
                    ],
                ),
              ),
              ],
       ),
      ),
    );
  }

}