import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_of_the_day/model/category_list_response.dart';
import 'package:quote_of_the_day/model/error_response.dart';

class CategoriesViewModel extends ChangeNotifier {
  List<Categories>? categories = [];
  String? erro = "";

  Future<void> getCategories() async {
    var response = await http.get(Uri.parse("https://quotes.rest/qod/categories?language=en&detailed=true"));
    if (response.statusCode == 200) {
      CategoryListResponse categoryListResponse = CategoryListResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map);
      categories = categoryListResponse.contents?.categories;
    } else {
      ErrorResponse errorResponse = ErrorResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map);
      erro = errorResponse.error?.message;
      print(erro);
    }

    notifyListeners();
  }
}