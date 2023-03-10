import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nuha_mobile_app/data/model/article.dart';
import 'package:nuha_mobile_app/data/model/detail_article.dart';
import 'package:nuha_mobile_app/data/model/search_article.dart';

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

  Future<DetailArticle> getDetailArticle(int id) async {
    try {
      final response = await http.get(Uri.parse("${_baseUrl}/${id}"));
      if (response.statusCode == 200) {
        return DetailArticle.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Detail Restaurant Data!');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<SearchArticle> searchArticle(String keyword) async {
    final response = await http.get(Uri.parse("${_baseUrl}/search/${keyword}"));
    if (response.statusCode == 200) {
      return SearchArticle.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Searching Result!');
    }
  }
}
