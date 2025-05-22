import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failuer, List<BookModel>>> fetchNewestBook() async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioException(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, List<BookModel>>> fetchFeautureBook() async {
    try {
      // Get books from different categories
      var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:(fiction OR science OR history OR biography)&orderBy=relevance',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioException(e));
      }
      return left(ServerError(e.toString()));
    }
  }
  
  @override
  Future<Either<Failuer, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioException(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
