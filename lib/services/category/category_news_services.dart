import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/CategoryNewsModel.dart';

class CategoryNewsServices {
  Future<CategoryNewsModel> getCategoryApi(String category) async {
    final response = await http.get(
      Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=9d181ecff0eb418a83d83b2fc5a830db",
      ),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return CategoryNewsModel.fromJson(data);
    } else {
      return CategoryNewsModel.fromJson(data);
    }
  }
}
