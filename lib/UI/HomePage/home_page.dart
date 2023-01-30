import 'dart:convert';
import 'dart:ffi';

import 'package:autox_flutter_training/SeviceApi/service_api.dart';
import 'package:autox_flutter_training/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class _HomePageContainer extends State<HomePageContainer> {
  late FToast fToast;
  Utils utils = Utils();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

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
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 32, bottom: 32),
              child: const Text(
                "University List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: FutureBuilder<String>(
                  future: ServiceApi().getUniversityList(),
                  builder: (context, snapshot) {
                    // Decode the JSON
                    var resData = json.decode(snapshot.data.toString());
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      resData[index]['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      resData[index]['state-province'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: showPinkStarIcon(index),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: resData == null ? 0 : resData.length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
       body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
   */
  //void getUniversityList() {
    // FutureBuilder<String>(
    //   future: ServiceApi().getUniversityList(
    //       'http://universities.hipolabs.com/search?country=Thailand'),
    //   builder: (context, snapshot) {
    //
    //   },
    // );
    //
    // FutureBuilder(
    //   future: DefaultAssetBundle.of(context)
    //       .loadString('assets/example/json_test.json'),
    //   builder:
    //       (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    // Decode the JSON
 // }

  bool showPinkStarIcon(int index) {
    //show Star icon if it's favorite or hide
    return (index % 2 == 0);
  }

  void onTapListViewCell() {
    //show toast when The cell item was taped
    utils.toastMessage(context, "Test Test");
  }
}
