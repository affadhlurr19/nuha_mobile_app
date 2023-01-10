import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/data/api/api_service.dart';
import 'package:nuha_mobile_app/data/model/detail_article.dart';

enum ResultState { loading, noData, hasData, error }

class DetailArticleProvider extends ChangeNotifier {
  final ApiService apiService;

  DetailArticleProvider({required this.apiService, required int idArticle}) {
    _fetchArticleDetails(idArticle);
  }

  late DetailArticle _detailArticle;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  DetailArticle get result => _detailArticle;
  ResultState get state => _state;

 Future<dynamic> _fetchArticleDetails(idArticle) async {
  try {
    _state = ResultState.loading;
    notifyListeners();
    final articles = await apiService.getDetailArticle(idArticle);
    if (articles.article!.toJson().isEmpty) {
      _state = ResultState.noData;
      notifyListeners();
      return _message = 'Data Kosong';
    } else {
      _state = ResultState.hasData;
      notifyListeners();
      return _detailArticle = articles;
    }
  } catch (e) {
    _state = ResultState.error;
    notifyListeners();
    return _message = '$e';
  }
 }
}