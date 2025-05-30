import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failuer, List<BookModel>>> searchBook({required String query});
}
