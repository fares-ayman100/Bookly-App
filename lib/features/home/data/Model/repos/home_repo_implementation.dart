import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/Model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/Model/repos/home_repos.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failuer, List<BookModel>>> getNewestBook() async {
    
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerError());
    }
  }

  @override
  Future<Either<Failuer, List<BookModel>>> getFeautureBook() {
    // TODO: implement getFeautureBook
    throw UnimplementedError();
  }
}
