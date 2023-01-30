import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceApi {
  Future<String> getUniversityList() async {
    var response = await http.get(
        Uri.parse("http://universities.hipolabs.com/search?country=Thailand"),
        headers: {"Accept": "application/json"});
    debugPrint('Res statusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      String responseBody = response.body;
      // debugPrint('Res api: $responseBody');
      return responseBody;
    } else {
      return 'http error statusCode = ${response.statusCode}';
    }
  }
}
