import 'package:nuha_mobile_app/data/model/detail_article.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblfavArticles = 'favorite_articles';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/nuhamobileapp.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblfavArticles (
             id INTEGER PRIMARY KEY,
             title TEXT,
             category TEXT,
             content TEXT,
             image_url TEXT,
             author TEXT,
             read_time INTEGER,
             created_at TEXT,
             updated_at TEXT
        )''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> insertFavArticles(Article article) async {
    final db = await database;
    await db!.insert(_tblfavArticles, article.toJson());
  }

  Future<List<Article>> getFavArticles() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblfavArticles);

    return results.map((res) => Article.fromJson(res)).toList();
  }

  Future<Map> getFavArticleskById(int id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblfavArticles,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavArticles(int id) async {
    final db = await database;

    await db!.delete(
      _tblfavArticles,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
