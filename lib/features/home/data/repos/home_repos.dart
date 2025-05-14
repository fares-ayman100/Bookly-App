import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<BookModel>>> fetchNewestBook();
  Future<Either<Failuer, List<BookModel>>> fetchFeautureBook();
  Future<Either<Failuer, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
