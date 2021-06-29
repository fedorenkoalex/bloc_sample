import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_bloc/data/models/local/post.dart';

class AppDatabase {
  final String _databaseName = 'test_app.db';

  final String _tableName = 'posts';

  final String _idField = 'id';
  final String _titleField = 'title';
  final String _bodyField = 'body';

  Future<Database> getDatabase() async {
    var path = await getDatabasesPath();
    return openDatabase(
      join(path, _databaseName),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE $_tableName('
          '$_idField INTEGER PRIMARY KEY AUTOINCREMENT, '
          '$_titleField TEXT NOT NULL,'
          '$_bodyField TEXT NOT NULL)',
        );
      },
      version: 1,
    );
  }

  Future<void> savePosts(List<Post> posts) async {
    final db = await getDatabase();
    for (var post in posts) {
      await db.insert(
        _tableName,
        post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Post>> getPosts() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(
        maps.length,
        (index) => Post(
              maps[index][_idField] as int,
              maps[index][_titleField] as String,
              maps[index][_bodyField] as String,
            ));
  }

  Future<Post> getPost(int postId) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [postId],
    );
    if (maps.isNotEmpty) {
      return Post(
        maps[0][_idField] as int,
        maps[0][_titleField] as String,
        maps[0][_bodyField] as String,
      );
    }
    return Post(-1, '', '');
  }

  Future<void> clearPosts() async {
    final db = await getDatabase();
    await db.delete(_tableName);
  }
}
