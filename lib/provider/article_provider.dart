import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nuha_mobile_app/data/api/api_service.dart';
import 'package:nuha_mobile_app/data/model/article.dart';

enum ResultState { loading, noData, hasData, error }

class ArticleProvider extends ChangeNotifier {
  final ApiService apiService;

  ArticleProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late ArticleResult _articleResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  ArticleResult get result => _articleResult;
  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.topHeadlines();
      if (article.article!.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articleResult = article;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Error --> $e";
    }
  }
}
