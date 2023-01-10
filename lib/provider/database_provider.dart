import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/data/db/database_helper.dart';
import 'package:nuha_mobile_app/data/model/detail_article.dart';

enum ResultState { loading, noData, hasData, error }

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getfavArticles();
  }

  ResultState? _state;
  ResultState? get state => _state;

  String _message = '';
  String get message => _message;

  List<Article> _favArticles = [];
  List<Article> get favArticles => _favArticles;

  void _getfavArticles() async {
    _favArticles = await databaseHelper.getFavArticles();
    if (_favArticles.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavArticles(Article article) async {
    try {
      await databaseHelper.insertFavArticles(article);
      _getfavArticles();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(int id) async {
    final favoritedArticle = await databaseHelper.getFavArticleskById(id);
    return favoritedArticle.isNotEmpty;
  }

  void removeFavArticles(int id) async {
    try {
      await databaseHelper.removeFavArticles(id);
      _getfavArticles();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
