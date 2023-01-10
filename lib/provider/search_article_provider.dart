import 'package:flutter/cupertino.dart';
import 'package:nuha_mobile_app/data/api/api_service.dart';
import 'package:nuha_mobile_app/data/model/search_article.dart';

enum ResultState { loading, noData, hasData, error }

class SearchArticleProvider extends ChangeNotifier {
  final ApiService apiService;
  String keyword;

  SearchArticleProvider({required this.apiService, this.keyword = '',}) {
    _fetchSearchResult(keyword);
  }

  late SearchArticle _searchArticle;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  SearchArticle get result => _searchArticle;
  ResultState get state => _state;

  search(String data) {
    keyword = data;
    _fetchSearchResult(keyword);
    notifyListeners();
  }

  Future<dynamic> _fetchSearchResult(keyword) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final articles = await apiService.searchArticle(keyword);
      if (articles.article!.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Data Kosong';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _searchArticle = articles;
      }
    }catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Silahkan cari nama artikel yang anda inginkan';
    }
  }

}