import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/TopHeadlinesModel.dart';

class TopHeadlinesServices {
  Future<TopHeadlinesModel> getTopHeadlinesApi() async {
    final response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=9d181ecff0eb418a83d83b2fc5a830db"),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return TopHeadlinesModel.fromJson(data);
    } else {
      return TopHeadlinesModel.fromJson(data);
    }
  }
}
