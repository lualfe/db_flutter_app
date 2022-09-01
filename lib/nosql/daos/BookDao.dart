import 'package:db_flutter_app/nosql/models/Book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {
  @Query("SELECT * FROM Book")
  Future<List<Book>> readAll();

  @insert
  Future<int> insertBook(Book book);

  @delete
  Future<int> deleteBook(Book book);
}
