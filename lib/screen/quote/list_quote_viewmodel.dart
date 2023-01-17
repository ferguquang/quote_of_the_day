import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/quote_list_response.dart';

class ListQuoteViewModel extends ChangeNotifier {
  List<Quotes>? quotes = [];

  Future<void> getListQuote(String categories) async {
    var response = await http.get(Uri.parse("https://quotes.rest/qod?category=$categories&language=en"));
    QuoteListResponse quoteListResponse = QuoteListResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map);
    quotes = quoteListResponse.contents?.quotes;
    notifyListeners();
  }
}