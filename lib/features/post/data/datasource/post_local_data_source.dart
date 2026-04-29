import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:bader_app_project/features/post/data/models/post_model.dart';

class PostLocalDataSource {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bader_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE posts (
        id TEXT PRIMARY KEY,
        title TEXT,
        content TEXT,
        type TEXT,
        created_at TEXT,
        likes_number INTEGER, -- تم التعديل إلى INTEGER
        islike INTEGER,       -- تم التعديل إلى INTEGER
        publisher_id TEXT,
        publisher_name TEXT
      )
    ''');
  }

  // --- 1. دالة حفظ البيانات في الكاش ---
  Future<void> cachePosts(List<PostModel> posts) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('posts');
      final batch = txn.batch();
      for (var post in posts) {
        batch.insert(
          'posts',
          post.toJson(forSqlite: true),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    });
    print("تم تحديث الكاش محلياً.");
  }

  // 2. دالة جلب البيانات من الكاش 
  Future<List<PostModel>> getCachedPosts(String sql) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(sql);

    if (maps.isEmpty) return [];
    
    return maps.map((json) => PostModel.fromJson(json)).toList();
  }
}