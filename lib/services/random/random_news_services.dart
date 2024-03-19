import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/RandomNews.dart';

class RandomNewsServices {
  Future<RandomNews> getRandomApi() async {
    final response = await http.get(
      Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=9d181ecff0eb418a83d83b2fc5a830db",
      ),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return RandomNews.fromJson(data);
    } else {
      return RandomNews.fromJson(data);
    }
  }
}
