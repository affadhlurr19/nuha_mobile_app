import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nuha_mobile_app/data/model/article.dart';

class ApiService {
  static const String _baseUrl =
      'https://nuha-api.000webhostapp.com/api/article';
  Future<ArticleResult> topHeadlines() async {
    try {
      final response = await http.get(Uri.parse("${_baseUrl}"));
      if (response.statusCode == 200) {
        return ArticleResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('Faiiled to load top headlines');
      }
    } catch (e) {
      rethrow;
    }
  }
}
