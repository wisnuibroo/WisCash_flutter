import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:wiscash_/model/model_favorite.dart';

class FavoriteController extends GetxController {
  static Database? _db;
  var tasks = <ModelFavorite>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT,       
            imagePath TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  Future<int> addTask(ModelFavorite task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(
        queryResult.map((data) => ModelFavorite.fromMap(data)).toList());
  }

  Future<void> deleteTaskByTitle(String title) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'title = ?', whereArgs: [title]);
    loadTasks();
  }

  Future<void> updateTask(int id, int isCompleted) async {
    var dbClient = await db;
    await dbClient!.update('tasks', {'isCompleted': isCompleted},
        where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }
}
