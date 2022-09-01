import 'dart:async';
import 'package:db_flutter_app/nosql/daos/BookDao.dart';
import 'package:db_flutter_app/nosql/models/Book.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}
